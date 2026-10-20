local Parent = script.Parent.Parent
local LuauPolyfillModule = require(Parent.Parent.LuauPolyfill)
local ErrorFunction = LuauPolyfillModule.Error
local Map = LuauPolyfillModule.Map
local _ = require(Parent.jsutils.invariant).invariant
local GraphQLString = require(Parent.type.scalars).GraphQLString
local DefinitionModule = require(Parent.type.definition)
local GraphQLList = DefinitionModule.GraphQLList
local GraphQLNonNull = DefinitionModule.GraphQLNonNull
local GraphQLObjectType = DefinitionModule.GraphQLObjectType
local StarWarsDataModule = require(script.Parent.starWarsData)
local GetFriendsFunction = StarWarsDataModule.getFriends
local GetHeroFunction = StarWarsDataModule.getHero
local GetHumanFunction = StarWarsDataModule.getHuman
local GetDroidFunction = StarWarsDataModule.getDroid
local Character = nil
local Human = nil
local Droid = nil
local Episode = DefinitionModule.GraphQLEnumType.new({
	name = "Episode",
	description = "One of the films in the Star Wars Trilogy",
	values = Map.new({
		{
			"NEW_HOPE",
			{ value = 4, description = "Released in 1977." }
		},
		{
			"EMPIRE",
			{ value = 5, description = "Released in 1980." }
		},
		{ "JEDI", { value = 6, description = "Released in 1983." } }
	})
})
Character = DefinitionModule.GraphQLInterfaceType.new({
	name = "Character",
	description = "A character in the Star Wars Trilogy",
	fields = function()
		-- upvalues: Map (copy), GraphQLNonNull (copy), GraphQLString (copy), GraphQLList (copy), Character (ref), Episode (copy)
		return Map.new({
			{
				"id",
				{
					description = "The id of the character.",
					type = GraphQLNonNull.new(GraphQLString)
				}
			},
			{
				"name",
				{
					description = "The name of the character.",
					type = GraphQLString
				}
			},
			{
				"friends",
				{
					description = "The friends of the character, or an empty list if they have none.",
					type = GraphQLList.new(Character)
				}
			},
			{
				"appearsIn",
				{
					description = "Which movies they appear in.",
					type = GraphQLList.new(Episode)
				}
			},
			{
				"secretBackstory",
				{
					description = "All secrets about their past.",
					type = GraphQLString
				}
			}
		})
	end,
	resolveType = function(p1)
		-- upvalues: Human (ref), Droid (ref)
		if p1.type == "Human" then
			return Human.name
		elseif p1.type == "Droid" then
			return Droid.name
		else
			assert(false)
		end
	end
})
Human = GraphQLObjectType.new({
	name = "Human",
	description = "A humanoid creature in the Star Wars universe.",
	fields = function()
		-- upvalues: Map (copy), GraphQLNonNull (copy), GraphQLString (copy), GraphQLList (copy), Character (ref), GetFriendsFunction (copy), Episode (copy), ErrorFunction (copy)
		return Map.new({
			{
				"id",
				{
					description = "The id of the human.",
					type = GraphQLNonNull.new(GraphQLString)
				}
			},
			{
				"name",
				{
					description = "The name of the human.",
					type = GraphQLString
				}
			},
			{
				"friends",
				{
					description = "The friends of the human, or an empty list if they have none.",
					type = GraphQLList.new(Character),
					resolve = function(p1)
						-- upvalues: GetFriendsFunction (upval)
						return GetFriendsFunction(p1)
					end
				}
			},
			{
				"appearsIn",
				{
					description = "Which movies they appear in.",
					type = GraphQLList.new(Episode)
				}
			},
			{
				"homePlanet",
				{
					description = "The home planet of the human, or null if unknown.",
					type = GraphQLString
				}
			},
			{
				"secretBackstory",
				{
					description = "Where are they from and how they came to be who they are.",
					type = GraphQLString,
					resolve = function()
						-- upvalues: ErrorFunction (upval)
						error(ErrorFunction("secretBackstory is secret."))
					end
				}
			}
		})
	end,
	interfaces = { Character }
})
Droid = GraphQLObjectType.new({
	name = "Droid",
	description = "A mechanical creature in the Star Wars universe.",
	fields = function()
		-- upvalues: Map (copy), GraphQLNonNull (copy), GraphQLString (copy), GraphQLList (copy), Character (ref), GetFriendsFunction (copy), Episode (copy), ErrorFunction (copy)
		return Map.new({
			{
				"id",
				{
					description = "The id of the droid.",
					type = GraphQLNonNull.new(GraphQLString)
				}
			},
			{
				"name",
				{
					description = "The name of the droid.",
					type = GraphQLString
				}
			},
			{
				"friends",
				{
					description = "The friends of the droid, or an empty list if they have none.",
					type = GraphQLList.new(Character),
					resolve = function(p1)
						-- upvalues: GetFriendsFunction (upval)
						return GetFriendsFunction(p1)
					end
				}
			},
			{
				"appearsIn",
				{
					description = "Which movies they appear in.",
					type = GraphQLList.new(Episode)
				}
			},
			{
				"secretBackstory",
				{
					description = "Construction date and the name of the designer.",
					type = GraphQLString,
					resolve = function()
						-- upvalues: ErrorFunction (upval)
						error(ErrorFunction("secretBackstory is secret."))
					end
				}
			},
			{
				"primaryFunction",
				{
					description = "The primary function of the droid.",
					type = GraphQLString
				}
			}
		})
	end,
	interfaces = { Character }
})

return {
	StarWarsSchema = require(Parent.type.schema).GraphQLSchema.new({
		query = GraphQLObjectType.new({
			name = "Query",
			fields = function()
				-- upvalues: Map (copy), Character (ref), Episode (copy), GetHeroFunction (copy), Human (ref), GraphQLNonNull (copy), GraphQLString (copy), GetHumanFunction (copy), Droid (ref), GetDroidFunction (copy)
				return Map.new({
					{
						"hero",
						{
							type = Character,
							args = {
								episode = {
									description = "If omitted, returns the hero of the whole saga. If provided, returns the hero of that particular episode.",
									type = Episode
								}
							},
							resolve = function(_, p1)
								-- upvalues: GetHeroFunction (upval)
								return GetHeroFunction(p1.episode)
							end
						}
					},
					{
						"human",
						{
							type = Human,
							args = {
								id = {
									description = "id of the human",
									type = GraphQLNonNull.new(GraphQLString)
								}
							},
							resolve = function(_, p1)
								-- upvalues: GetHumanFunction (upval)
								return GetHumanFunction(p1.id)
							end
						}
					},
					{
						"droid",
						{
							type = Droid,
							args = {
								id = {
									description = "id of the droid",
									type = GraphQLNonNull.new(GraphQLString)
								}
							},
							resolve = function(_, p1)
								-- upvalues: GetDroidFunction (upval)
								return GetDroidFunction(p1.id)
							end
						}
					}
				})
			end
		}),
		types = { Human, Droid }
	})
}