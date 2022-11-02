- This example demonstrates how to:

1. perform HTTP requests
2. handle pagination
3. cancel HTTP requests if the UI stops listening to the response before completion
4. implement a search-bar that has its own independent state.
5. support deep-linking to an item
6. optimize widget rebuilds (only what needs to update does update).

Since this project uses freezed for code generation, be sure to run the generator with the following command before attempting to build/run the application:
```
flutter pub run build_runner build
```