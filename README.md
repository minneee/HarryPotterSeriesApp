# 해리포터 시리즈 앱 (Harry Potter Series App)

해리포터 책 시리즈의 정보를 보여주는 iOS 앱입니다. 각 책의 커버, 제목, 작가, 요약, 챕터 목록 등을 확인할 수 있습니다. 요약내용은 더보기/접기 기능을 통해 전체를 보거나 숨길 수 있습니다.

## ✨ 주요 기능

- 해리포터 시리즈 전체 책 목록 표시
- 각 책의 상세 정보 제공
- 요약내용 확장/축소 
- 로컬 JSON 데이터를 활용한 데이터 관리
- 가로모드 지원

## 🛠 기술 스택 및 아키텍처 (Tech Stack & Architecture)

- **Language**: Swift
- **UI Framework**: UIKit
- **Asynchronous**: Combine
- **Architecture**: MVVM (Model-View-ViewModel)
- **Data**: 로컬 `data.json` 파일

## 📂 프로젝트 구조 (Project Structure)

```
HarryPotterSeriesApp/
├── Application/      # 앱의 생명주기 관리 
├── Model/            # 데이터 모델 
├── ViewModel/        # 뷰를 위한 데이터 및 로직 
├── View/             # 사용자 인터페이스 
├── Services/         # 데이터 처리 및 관리 
├── Resources/        # 이미지, JSON 데이터 등 리소스 파일
└── Extensions/       # 편의성을 위한 확장 기능
```

## 📔 트러블 슈팅 TIL
[Repository Pattern](https://0minnie0.tistory.com/66)
[UIStackView의 타입과 case let 패턴](https://0minnie0.tistory.com/68)
