# DailyFXService

#### Models and Services to represent and manage the Daily FX data.

##### DailyFXService

A small class to encapsulate all Daily FX API interactions and expose only what the clients need to know. Namely, access to streams of the decoded models: `Dashboard`, & `Markets`.

Apple's first party networking APIs are nowadays so powerful and concise that, as you will see, this clas is barely doing anything at all. It will hopefully serve as a nice namespace to encapsulate more business logic as the application grows however. 

I have chosen to implement the public API of the service using an `AsyncThrowingStream`, partly to experiment with Swift Structured Concurrecy suite further, but also to future proof the API and minimise the need to update it's comsumers later on. I anticipate, for example, that I would eventually want to return frequent updates to the `markets` data and I will now be able to do so without changing the consumers of this class.  

##### Models

The models to represent the types of the Daily FX types are very simple due to the design of the API. No complex data transformations were needed, so I opted for a very straight forward Codable implementation without intermediatry types.

I have attempted to santise the data in some places by implementing custom decoding for a few of the types. This is almost exclusively to remove the need for unwrapping optionals in the rest of the code by providing empty structures instead of `nil`.  
