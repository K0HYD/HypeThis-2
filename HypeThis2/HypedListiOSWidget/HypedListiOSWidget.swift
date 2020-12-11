//
//  HypedListiOSWidget.swift
//  HypedListiOSWidget
//
//  Created by Dale Puckett on 12/11/20.
//

import WidgetKit
import SwiftUI

struct Provider: TimelineProvider {
    func placeholder(in context: Context) -> HypedEventEntry {
        HypedEventEntry(date: Date(), hypedEvent: testHypedEvent1)
    }
    
    func getSnapshot(in context: Context, completion: @escaping (HypedEventEntry) -> ()) {
        let entry = HypedEventEntry(date: Date(), hypedEvent: testHypedEvent1)
        completion(entry)
    }
    
    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [HypedEventEntry] = []
        
        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        for hourOffset in 0 ..< 5 {
            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
            let entry = HypedEventEntry(date: entryDate, hypedEvent: testHypedEvent1)
            entries.append(entry)
        }
        
        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}

struct HypedEventEntry: TimelineEntry {
    let date: Date
    let hypedEvent: HypedEvent?
}

struct HypedListiOSWidgetEntryView : View {
    @Environment(\.widgetFamily) var widgetFamily
    var entry: Provider.Entry
    
    var body: some View {
        GeometryReader { geometry in
            if entry.hypedEvent != nil {
                ZStack {
                    if entry.hypedEvent!.image() != nil {
                        entry.hypedEvent!.image()!
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: geometry.size.width, height: geometry.size.height)
                    } else {
                        entry.hypedEvent!.color
                        Color.black
                            .opacity(0.15)
                    }
                    Text(entry.hypedEvent!.title)
                        .foregroundColor(.white)
                        .font(fontSize())
                        .padding()
                        .multilineTextAlignment(.center)
                    VStack {
                        Spacer()
                        HStack {
                            Spacer()
                            Text(entry.hypedEvent!.timeFromNow())
                                .bold()
                                .padding(10)
                                .foregroundColor(.white)
                        }
                    }
                }
            } else {
                VStack {
                    Spacer()
                    Text("No upcoming Events. Tap me to add additional awesome events!")
                        .padding()
                        .multilineTextAlignment(.center)
                        .font(fontSize())
                    Spacer()
                }
            }
        }
    }
    func fontSize() -> Font {
        switch widgetFamily {
        case .systemSmall: return .title2
        case .systemMedium: return .title
        case .systemLarge: return .largeTitle
        @unknown default: return .body
        }
    }
}

@main
struct HypedListiOSWidget: Widget {
    let kind: String = "HypedListiOSWidget"
    
    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            HypedListiOSWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("My Widget")
        .description("This is an example widget.")
    }
}

struct HypedListiOSWidget_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            HypedListiOSWidgetEntryView(entry: HypedEventEntry(date: Date(), hypedEvent: testHypedEvent1))
                .previewContext(WidgetPreviewContext(family: .systemSmall))
            
            HypedListiOSWidgetEntryView(entry: HypedEventEntry(date: Date(), hypedEvent: testHypedEvent1))
                .previewContext(WidgetPreviewContext(family: .systemMedium))
            
            HypedListiOSWidgetEntryView(entry: HypedEventEntry(date: Date(), hypedEvent: testHypedEvent1))
                .previewContext(WidgetPreviewContext(family: .systemLarge))
            
            HypedListiOSWidgetEntryView(entry: HypedEventEntry(date: Date(), hypedEvent: testHypedEvent2))
                .previewContext(WidgetPreviewContext(family: .systemSmall))
            
            HypedListiOSWidgetEntryView(entry: HypedEventEntry(date: Date(), hypedEvent: testHypedEvent2))
                .previewContext(WidgetPreviewContext(family: .systemMedium))
            
            HypedListiOSWidgetEntryView(entry: HypedEventEntry(date: Date(), hypedEvent: testHypedEvent2))
                .previewContext(WidgetPreviewContext(family: .systemLarge))
            
            HypedListiOSWidgetEntryView(entry: HypedEventEntry(date: Date(), hypedEvent: nil))
                .previewContext(WidgetPreviewContext(family: .systemSmall))
            
            HypedListiOSWidgetEntryView(entry: HypedEventEntry(date: Date(), hypedEvent: nil))
                .previewContext(WidgetPreviewContext(family: .systemMedium))
            
            HypedListiOSWidgetEntryView(entry: HypedEventEntry(date: Date(), hypedEvent: nil))
                .previewContext(WidgetPreviewContext(family: .systemLarge))
        }
    }
}
