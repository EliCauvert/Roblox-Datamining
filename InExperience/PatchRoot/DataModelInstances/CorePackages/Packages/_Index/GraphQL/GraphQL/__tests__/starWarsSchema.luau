local parent = script.Parent.Parent
local luauPolyfillModule = require(parent.Parent.LuauPolyfill)
local error = luauPolyfillModule.Error
local map = luauPolyfillModule.Map
local _ = require(parent.jsutils.invariant).invariant
local graphQLSchema = require(parent.type.schema).GraphQLSchema
local graphQLString = require(parent.type.scalars).GraphQLString
local definitionModule = require(parent.type.definition)
local graphQLList = definitionModule.GraphQLList
local graphQLNonNull = definitionModule.GraphQLNonNull
local graphQLEnumType = definitionModule.GraphQLEnumType
local graphQLInterfaceType = definitionModule.GraphQLInterfaceType
local graphQLObjectType = definitionModule.GraphQLObjectType
local starWarsDataModule = require(script.Parent.starWarsData)
local getFriends = starWarsDataModule.getFriends
local getHero = starWarsDataModule.getHero
local getHuman = starWarsDataModule.getHuman
local getDroid = starWarsDataModule.getDroid
local var1 = nil
local var2 = nil
local var3 = nil
local var4 = graphQLEnumType.new({
	name = "Episode",
	description = "One of the films in the Star Wars Trilogy",
	values = map.new({
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
var1 = graphQLInterfaceType.new({
	name = "Character",
	description = "A character in the Star Wars Trilogy",
	fields = function()
		-- upvalues: map (ref), graphQLNonNull (ref), graphQLString (ref), graphQLList (ref), var1 (write), var4 (ref)
		return map.new({
			{
				"id",
				{
					description = "The id of the character.",
					type = graphQLNonNull.new(graphQLString)
				}
			},
			{
				"name",
				{
					description = "The name of the character.",
					type = graphQLString
				}
			},
			{
				"friends",
				{
					description = "The friends of the character, or an empty list if they have none.",
					type = graphQLList.new(var1)
				}
			},
			{
				"appearsIn",
				{
					description = "Which movies they appear in.",
					type = graphQLList.new(var4)
				}
			},
			{
				"secretBackstory",
				{
					description = "All secrets about their past.",
					type = graphQLString
				}
			}
		})
	end,
	resolveType = function(p1)
		-- upvalues: var2 (write), var3 (write)
		if p1.type == "Human" then
			return var2.name
		elseif p1.type == "Droid" then
			return var3.name
		end
		assert(false)
	end
})
var2 = graphQLObjectType.new({
	name = "Human",
	description = "A humanoid creature in the Star Wars universe.",
	fields = function()
		-- upvalues: map (ref), graphQLNonNull (ref), graphQLString (ref), graphQLList (ref), var1 (write), getFriends (ref), var4 (ref), error (ref)
		return map.new({
			{
				"id",
				{
					description = "The id of the human.",
					type = graphQLNonNull.new(graphQLString)
				}
			},
			{
				"name",
				{
					description = "The name of the human.",
					type = graphQLString
				}
			},
			{
				"friends",
				{
					description = "The friends of the human, or an empty list if they have none.",
					type = graphQLList.new(var1),
					resolve = function(p1)
						-- upvalues: getFriends (copy)
						return getFriends(p1)
					end
				}
			},
			{
				"appearsIn",
				{
					description = "Which movies they appear in.",
					type = graphQLList.new(var4)
				}
			},
			{
				"homePlanet",
				{
					description = "The home planet of the human, or null if unknown.",
					type = graphQLString
				}
			},
			{
				"secretBackstory",
				{
					description = "Where are they from and how they came to be who they are.",
					type = graphQLString,
					resolve = function()
						-- upvalues: error (copy)
						error(error("secretBackstory is secret."))
					end
				}
			}
		})
	end,
	interfaces = { var1 }
})
var3 = graphQLObjectType.new({
	name = "Droid",
	description = "A mechanical creature in the Star Wars universe.",
	fields = function()
		-- upvalues: map (ref), graphQLNonNull (ref), graphQLString (ref), graphQLList (ref), var1 (write), getFriends (ref), var4 (ref), error (ref)
		return map.new({
			{
				"id",
				{
					description = "The id of the droid.",
					type = graphQLNonNull.new(graphQLString)
				}
			},
			{
				"name",
				{
					description = "The name of the droid.",
					type = graphQLString
				}
			},
			{
				"friends",
				{
					description = "The friends of the droid, or an empty list if they have none.",
					type = graphQLList.new(var1),
					resolve = function(p1)
						-- upvalues: getFriends (copy)
						return getFriends(p1)
					end
				}
			},
			{
				"appearsIn",
				{
					description = "Which movies they appear in.",
					type = graphQLList.new(var4)
				}
			},
			{
				"secretBackstory",
				{
					description = "Construction date and the name of the designer.",
					type = graphQLString,
					resolve = function()
						-- upvalues: error (copy)
						error(error("secretBackstory is secret."))
					end
				}
			},
			{
				"primaryFunction",
				{
					description = "The primary function of the droid.",
					type = graphQLString
				}
			}
		})
	end,
	interfaces = { var1 }
})

return {
	StarWarsSchema = graphQLSchema.new({
		query = graphQLObjectType.new({
			name = "Query",
			fields = function()
				-- upvalues: map (ref), var1 (write), var4 (ref), getHero (ref), var2 (write), graphQLNonNull (ref), graphQLString (ref), getHuman (ref), var3 (write), getDroid (ref)
				return map.new({
					{
						"hero",
						{
							type = var1,
							args = {
								episode = {
									description = "If omitted, returns the hero of the whole saga. If provided, returns the hero of that particular episode.",
									type = var4
								}
							},
							resolve = function(_, p1)
								-- upvalues: getHero (copy)
								return getHero(p1.episode)
							end
						}
					},
					{
						"human",
						{
							type = var2,
							args = {
								id = {
									description = "id of the human",
									type = graphQLNonNull.new(graphQLString)
								}
							},
							resolve = function(_, p1)
								-- upvalues: getHuman (copy)
								return getHuman(p1.id)
							end
						}
					},
					{
						"droid",
						{
							type = var3,
							args = {
								id = {
									description = "id of the droid",
									type = graphQLNonNull.new(graphQLString)
								}
							},
							resolve = function(_, p1)
								-- upvalues: getDroid (copy)
								return getDroid(p1.id)
							end
						}
					}
				})
			end
		}),
		types = { var2, var3 }
	})
}