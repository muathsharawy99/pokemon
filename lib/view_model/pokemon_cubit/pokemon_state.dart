abstract class PokemonState{}
class InitState extends PokemonState{}

class GetPokemonLoading extends PokemonState{}
class GetPokemonSuccess extends PokemonState{}
class GetPokemonError extends PokemonState{}


class GetPokemonDetailsLoading extends PokemonState{}
class GetPokemonDetailsSuccess extends PokemonState{}
class GetPokemonDetailsError extends PokemonState{}