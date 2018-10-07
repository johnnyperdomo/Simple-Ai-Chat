# Simple-Ai-Chat
Natural Language Processing(NLP) A.I. Chatbot made with Swift 4

## Preview
![Alt Text](https://media.giphy.com/media/9FXRsIMYuH834w2fBD/giphy.gif)

**Built with**
- Ios 12
- Xcode 10 

## Features
- **Chatbot uses natural language processing to understand what the user is trying to say, no matter the way he says it.**
- **Chatbot provides a unique experience to the user by using [DialogFlow](https://dialogflow.com/) and responding to user responses according to the subject**
  ```swift
  AI.sharedService.textRequest('user_response')
  ```
- **Chat bubbles have an expandable *tableView* according to message size, by using ```automaticDimension```**

## Requirements
```swift
import AI
```

**_Pod Files_**      
```swift
pod 'AI' //Can use Cocoa Touch
```
[NLP Artificial intelligence made by using DialogFlow](https://dialogflow.com/)

[Documentation Resources](https://dialogflow.com/docs)

## Project Configuration
You'll have to configure your ```DialogFlow``` account to have access to A.I. training console.
> You can train your A.I. to understand and reply to whatever you want. It can perform any task.

1. Create your [Dialogflow](https://dialogflow.com/) account

2. Create your first [agent](https://dialogflow.com/docs/agents)

3. Get ```Client Access Token``` from Agent's *settings menu* to connect to the api client from your app
   ```swift
   //File: Appdelegate.swift
   AI.configure(YOUR_PERSONAL_CLIENT_ACCESS_TOKEN)
   ```
4. Start communicating with your A.I. to take over the world!!! :stuck_out_tongue: :alien: :smirk:
## License
Standard MIT [License](https://github.com/johnnyperdomo/Simple-Ai-Chat/blob/master/LICENSE)
