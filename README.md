- This example demonstrates how to:

1. perform HTTP requests
2. handle pagination
3. cancel HTTP requests if the UI stops listening to the response before completion
4. implement a search-bar that has its own independent state.
5. support deep-linking to an item
    딥링크는 특정 페이지에 도달 할 수 있는 링크를 말합니다. 비슷하게 모바일 딥링크란 모바일 어플리케이션의 특정 페이지에 도달 할 수 있는 링크를 말하는 것입니다. 여러분들이 친구들과 특정 웹 페이지를 공유할 때 자주 사용하는 웹 URL(예를 들어, http://map.naver.com/local/siteview.nhn?code=19585783) 처럼, 모바일에 어플리케이션에도 특정 페이지에 들어갈 수 있는 링크가 있는 것입니다. 
    유튜브는 youtube://, 멜론(아이폰)은 meloniphone://, 벅스는 bugs3:// 프로토콜을 사용합니다. 가끔씩 모바일로 웹 서핑을 하다가, 어떤 버튼을 눌렀는데 네이티브 앱으로 바로 이동하는 경험을 해보신 분들이 있으실 겁니다. 그것이 바로 '모바일 딥링크'를 이용하여, 특정 앱 페이지로 들어가는 것입니다.

6. optimize widget rebuilds (only what needs to update does update).

Since this project uses freezed for code generation, be sure to run the generator with the following command before attempting to build/run the application:
```
flutter pub run build_runner build
```

11월 3일자로 아직 under constuct였음. 
https://github.com/rrousselGit/riverpod/tree/master/examples/marvel