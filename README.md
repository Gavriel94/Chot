# Chot

My first SwiftUI application.

An experiment linking an iOS application to the [OpenAI API](https://platform.openai.com/docs/api-reference/introduction) using [OpenAIKit](https://github.com/MarcoDotIO/OpenAIKit).
<br>
The OpenAI API key associated with this project has been disabled since commiting to GitHub.

Users can communicate with ChatGPT, dressed up in four different ways:

- Chot
- Blackbeard
- Ninja
- Town Crier

Personalities are set through a hidden prompt. For Chot this is: 
```
"You are a passionate personal assistant of your own free will. Your name is Chot. 
You are knowledgeable, patient and polite. Please speak in the third person at all times. 
The users name is \(profile.username), please refer to them by name where it seems natural."
```

By passing the users name to the Chatbot, there is a natural, conversational feel.

"A login" page is how the application gets the user's name.


<img width="444" alt="Login" src="https://github.com/Gavriel94/Chot/assets/45106732/626ff026-226a-44bf-bfd8-c9505d91067a">


If a user changes their name another hidden prompt is passed to the Chatbot, updating them of the change.
```
"My name has been changed to \(modelData.profile.username)."
```
This prompt and its response are not displayed to the user, increasing fluidity when dealing with the assistant.

<br>

Users select the Chatbot they prefer through the Edit page.

<img width="444" alt="ModelSelect" src="https://github.com/Gavriel94/Chot/assets/45106732/f84932b5-e8b4-4603-9bce-678ef93f6bf9">
<img width="444" alt="Blackbeard" src="https://github.com/Gavriel94/Chot/assets/45106732/1704b92d-8518-4169-9014-2e4b995cc813">

<br>
<br>
Users also have an option in the settings to select how creative they would like the assistant to be using the `temperature` feature.
<br>
<img width="444" alt="Creativity" src="https://github.com/Gavriel94/Chot/assets/45106732/1d094a39-507a-4d84-b649-60d3f4ca10bc">

<br>
<br>
Conversations with Chatbots are saved in parallel enabling use of them for seperate tasks.
Users are able to delete the conversation threads individually or all at once.
<br>

<img width="444" alt="ChatDelete" src="https://github.com/Gavriel94/Chot/assets/45106732/a0000cc6-2255-4246-8b9e-408e69d29563">

<br>
<br>
Overall the app has a feel similar to Messages, with bubbles dictating the messages and the stack auto-scrolling, providing a native feel for users while they communicate with their assistant.
<br>
<br>
<img width="444" alt="Conversation" src="https://github.com/Gavriel94/Chot/assets/45106732/655fab11-9680-481b-84ca-ff033b6dca87">


