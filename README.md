# OMDb-API-iOS-Client-MVVM
An OMDb-API iOS Client with MVVM architecture and UnitTests

For detailed API documentation, please look at http://omdbapi.com

## About The Project

This project is an OMDb-API (Open Movie Database) iOS client application. There is no 3rd party library and all code is native swift. 
In MVVM part, I used my own framework as a submodule. For detail, <a href="https://github.com/TanselKahyaoglu/Swift-MVVM-Architecture">click here.</a>
- It includes followings:
  - MVVM architecture
  - Decodable & Encodable
  - Unit Tests



<!-- GETTING STARTED -->
## Getting Started

To get a local copy up and running follow these simple steps.

### Prerequisites

- Swift 5
- iOS 13.6
- Xcode 11.6
- Api key from <a href="http://omdbapi.com/apikey.aspx">OMDb API</a>

### Installation

1. Clone the repo
```sh
git clone https://github.com/TanselKahyaoglu/OMDb-API-iOS-Client-MVVM
```
2. Open MovieApp-Client.xcodeproj file with Xcode

3. Change your api key on Constants.swift
```sh
struct Constants {

    struct Network {
        static let apiKey = "********" //change this
    }
    
}
```

<!-- CONTRIBUTING -->
## Contributing

I'm really open for contributing. We can make this project great together. 

 - Fork the project

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/MyFeature`)
3. Commit your Changes (`git commit -m 'Add some MyFeature'`)
4. Push to the Branch (`git push origin feature/MyFeature`)
5. Open a Pull Request

  - Or <p><a href="mailto:tansel.kahyaoglu@gmail.com">Mail me</a></p>



<!-- LICENSE -->
## License

Distributed under the MIT License. See `LICENSE` for more information.

<!-- CONTACT -->
## Contact

Tansel Kahyaoğlu
<p><a href="mailto:tansel.kahyaoglu@gmail.com">Mail</a></p>
<p><a href="https://linkedin.com/in/tanselkahyaoglu">Linkedin</a></p>
