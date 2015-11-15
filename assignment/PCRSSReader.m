//
//  PCRSSReader.m
//  assignment
//
//  Created by Patrick Cunningham on 28/01/2014.
//  Copyright (c) 2014 Patrick Cunningham. All rights reserved.
//

#import "PCRSSReader.h"

@implementation PCRSSReader

NSXMLParser *parser;

BOOL flagOfChannelLastBuildDate = NO;
NSMutableString *channelLastBuildDate;
BOOL flagOfItem = NO;
BOOL flagOfItemTitle = NO;
NSMutableString *itemTitle;
BOOL flagOfItemDescription = NO;
NSMutableString *itemDescription;
BOOL flagOfItemLink = NO;
NSMutableString *itemLink;
BOOL flagOfItemPubDate = NO;
NSMutableString *itemPubDate;

NSMutableArray *items;
PCChannel *channel;
PCItem *item;

- (id)init
{
    if(self = [super init])
    {
        // parse RSS document
        parser = [[NSXMLParser alloc] initWithContentsOfURL:[NSURL URLWithString:@"http://feeds.bbci.co.uk/sport/0/football/rss.xml?edition=uk"]];
        parser.delegate = self;
    }
    return self;
}

- (BOOL)parse
{
    return [parser parse];
}

- (void)parserDidStartDocument:(NSXMLParser *)parser
{
    // initialise properties to load feed values
    channel = [PCChannel new];
    items = [NSMutableArray new];
}

- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict
{
    // flag required items
    if([elementName isEqualToString:@"lastBuildDate"])
    {
        flagOfChannelLastBuildDate = YES;
        channelLastBuildDate = [NSMutableString new];
    }
    
    if([elementName isEqualToString:@"item"])
    {
        flagOfItem = YES;
        item = [PCItem new];
    }
    
    if([elementName isEqualToString:@"title"] && flagOfItem)
    {
        flagOfItemTitle = YES;
        itemTitle = [NSMutableString new];
    }
    
    if([elementName isEqualToString:@"description"] && flagOfItem)
    {
        flagOfItemDescription = YES;
        itemDescription = [NSMutableString new];
    }
    
    if([elementName isEqualToString:@"link"] && flagOfItem)
    {
        flagOfItemLink = YES;
        itemLink = [NSMutableString new];
    }
    
    if([elementName isEqualToString:@"pubDate"] && flagOfItem)
    {
        flagOfItemPubDate = YES;
        itemPubDate = [NSMutableString new];
    }
}

/*
 
 */
- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string
{
    // assign required item properties
    if(flagOfChannelLastBuildDate)
    {
        [channelLastBuildDate appendString:string];
    }
    
    if(flagOfItem && flagOfItemTitle)
    {
        [itemTitle appendString:string];
    }
    
    if(flagOfItem && flagOfItemDescription)
    {
        [itemDescription appendString:string];
    }
    
    if(flagOfItem && flagOfItemLink)
    {
        [itemLink appendString:string];
    }
    
    if(flagOfItem && flagOfItemPubDate)
    {
        [itemPubDate appendString:string];
    }
}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
    // assign required channel properties
    if([elementName isEqualToString:@"lastBuildDate"])
    {
        flagOfChannelLastBuildDate = NO;
        channel.lastBuildDate = [NSString stringWithString:channelLastBuildDate];
    }
    
    if([elementName isEqualToString:@"item"])
    {
        flagOfItem = NO;
        [items addObject:item];
    }
    
    if([elementName isEqualToString:@"title"] && flagOfItem)
    {
        flagOfItemTitle = NO;
        item.title = itemTitle;
        itemTitle = nil;
    }
    
    if([elementName isEqualToString:@"description"] && flagOfItem)
    {
        flagOfItemDescription = NO;
        item.description = itemDescription;
        itemDescription = nil;
    }
    
    if([elementName isEqualToString:@"link"] && flagOfItem)
    {
        flagOfItemLink = NO;
        item.link = itemLink;
        itemLink = nil;
    }
    
    if([elementName isEqualToString:@"pubDate"] && flagOfItem)
    {
        flagOfItemPubDate = NO;
        item.pubDate = itemPubDate;
        itemPubDate = nil;
    }
}

- (void)parserDidEndDocument:(NSXMLParser *)parser
{
    // once finished parsing RSS write properties
    self.feed = [PCFeed new];
    self.feed.channel = channel;
    // Add page no property to each feed item - starting with 303
    int pageNo = 303;
    // Take first ten feed items
    NSArray *headlines = [items subarrayWithRange:NSMakeRange(0, 10)];
    for (PCItem *headlineItem in headlines) {
        headlineItem.pageNo = [NSString stringWithFormat:@"%d", pageNo++];
    }
    // take last ten items (featured items)
    NSArray *features = [items subarrayWithRange:NSMakeRange(items.count-10,10)];
    for (PCItem *featureItem in features) {
        featureItem.pageNo = [NSString stringWithFormat:@"%d", pageNo++];
    }
    // assign new items array with page numbers
    NSMutableArray *headlinesAndFeatures = [NSMutableArray arrayWithArray: headlines];
    [headlinesAndFeatures addObjectsFromArray: features];
    self.feed.items = headlinesAndFeatures;
}

@end

