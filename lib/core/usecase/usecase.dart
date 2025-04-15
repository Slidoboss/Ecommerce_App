abstract class UseCase<Type,Params> {
  
  Future<Type> call({Params params}); //Params is a type that allows you define params with any DataType. Type as well does the same thing.
}