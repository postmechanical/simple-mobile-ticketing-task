# Simple Mobile Ticketing Task

## Requirements
Welcome to the world of mobile ticketing! This application allows users to select their fare before purchasing their bus tickets. It consist of three screens:

1. Rider type selection
2. Fare type selection
3. Confirmation

All of the data required for these screens comes from a single JSON response with the following format:


```javascript
{
  "Adult": {
    "fares": [
      { "description": "2.5 Hour Ticket", "price": 2.5 },
      { "description": "1 Day Pass", "price": 5.0 },
      { "description": "30 Day Pass", "price": 100 }
    ],
    "subtext": null
  },
  "Child": {
    "fares": [
      { "description": "2.5 Hour Ticket", "price": 1.5 },
      { "description": "1 Day Pass", "price": 2.0 },
      { "description": "30 Day Pass", "price": 40.0 }
    ],
    "subtext": "Ages 8-17"
  },
  "Senior": {
    "fares": [
      { "description": "2.5 Hour Ticket", "price": 1.0 },
      { "description": "1 Day Pass", "price": 2.0 },
      { "description": "30 Day Pass", "price": 40.0 }
    ],
    "subtext": "Ages 60+"
  }
}

```

The design team has already created wireframes for what each of these screens should look like:
![http://i.imgur.com/NieOGom.png](http://i.imgur.com/NieOGom.png)

## Future

Given more time I would make the following changes:

- Implement an API client based on `NSURLSessionDataTask` using `Router` pattern to fetch current data from server.
- Request a change to the fares response payload that plays better with the default behavior of `Codable` and doesn't conflict with protocol specific keywords (e.g., `description`) such as the following:

```javascript
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
