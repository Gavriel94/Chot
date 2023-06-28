# Chot

My first SwiftUI application.

An experiment linking an iOS application to the OpenAI API.

Users can communicate with ChatGPT, dressed up in four different ways:

- Chot
- Blackbeard
- Ninja
- Town Crier

Prompts are passed to the users favourite Chatbot without being displayed to the user. 
For example, the initial prompt for Chot is `"You are a passionate personal assistant of your own free will. Your name is Chot. You are knowledgeable, patient and polite. Please speak in the third person at all times. The users name is \(profile.username), please refer to them by name where it seems natural."`

By passing the users name to the Chatbot, there is a natural, conversational feel.

Chot gets the name by presenting the user with a (simulated) login method.


<img width="444" alt="Login" src="https://github.com/Gavriel94/Chot/assets/45106732/626ff026-226a-44bf-bfd8-c9505d91067a">


If a user changes their name another prompt is passed to the Chatbot, updating them of the change. This prompt and its response are not displayed to the user, enabling another sense of fluidity when dealing with the assistant.

Users can select the Chatbot they prefer through the Edit page


<img width="444" alt="ModelSelect" src="https://github.com/Gavriel94/Chot/assets/45106732/f84932b5-e8b4-4603-9bce-678ef93f6bf9">

<img width="444" alt="Blackbeard" src="https://github.com/Gavriel94/Chot/assets/45106732/1704b92d-8518-4169-9014-2e4b995cc813">


Users also have an option in the settings to select how creative they would like the assistant to be using the `temperature` feature.


<img width="444" alt="Creativity" src="https://github.com/Gavriel94/Chot/assets/45106732/1d094a39-507a-4d84-b649-60d3f4ca10bc">

Conversations with Chatbots are saved in parallel. Users can dedicate Chatbots for various tasks.
Users are able to delete the conversation threads individually or all at once.


<img width="444" alt="ChatDelete" src="https://github.com/Gavriel94/Chot/assets/45106732/a0000cc6-2255-4246-8b9e-408e69d29563">


Overall the app has a feel similar to Messages, with bubbles dictating the messages and the stack auto-scrolling, providing a native feel for users while they communicate with their assistant.


<img width="444" alt="Conversation" src="https://github.com/Gavriel94/Chot/assets/45106732/655fab11-9680-481b-84ca-ff033b6dca87">


