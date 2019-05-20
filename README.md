# Simple Mobile Ticketing Task

Given more time I would make the following changes:

- Implement an API client based on `NSURLSessionDataTask` using `Router` pattern to fetch current data from server.
- Request a change to the fares response payload that plays better with the default behavior of `Codable` and doesn't conflict with protocol specific keywords (e.g., `description`) such as the following:

```
{
    "riderFares": [
        {
            "type": "Adult",
            "fares":  [
                {
                    "duration": "2.5 Hour Ticket",
                    "price": 2.5
                },
                {
                    "duration": "1 Day Pass",
                    "price": 5.0
                },
                {
                    "duration": "30 Day Pass",
                    "price": 100
                }
            ],
            "details": null
        }
    ]
}
```
- Add support for localization. Given the dynamic nature of this data I would request that user visible strings in fares response payload be sent over the wire localized based on a `locale` query param derived from the device's current local value.
- Implement a more generic form based approach to the UI rather than using `UITableViewController` instances directly.
