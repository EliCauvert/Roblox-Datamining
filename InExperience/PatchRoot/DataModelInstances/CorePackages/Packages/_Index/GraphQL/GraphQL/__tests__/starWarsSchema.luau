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
local var3 = nil
local var4 = nil
local var5 = nil
local var6 = graphQLEnumType.new({
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
var3 = graphQLInterfaceType.new({
	name = "Character",
	description = "A character in the Star Wars Trilogy",
	fields = function() --[[ line: 127 ]]
		-- upvalues: map (ref), graphQLNonNull (ref), graphQLString (ref), graphQLList (ref), var3 (write), var6 (ref)
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
					type = graphQLList.new(var3)
				}
			},
			{
				"appearsIn",
				{
					description = "Which movies they appear in.",
					type = graphQLList.new(var6)
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
	resolveType = function(p0) --[[ line: 166 ]]
		-- upvalues: var4 (write), var5 (write)
		if p0.type == "Human" then
			return var4.name
		elseif p0.type == "Droid" then
			return var5.name
		end
		assert(false)
	end
})
var4 = graphQLObjectType.new({
	name = "Human",
	description = "A humanoid creature in the Star Wars universe.",
	fields = function() --[[ line: 195 ]]
		-- upvalues: map (ref), graphQLNonNull (ref), graphQLString (ref), graphQLList (ref), var3 (write), getFriends (ref), var6 (ref), error (ref)
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
					type = graphQLList.new(var3),
					resolve = function(p1) --[[ line: 216 ]]
						-- upvalues: getFriends (copy)
						return getFriends(p1)
					end
				}
			},
			{
				"appearsIn",
				{
					description = "Which movies they appear in.",
					type = graphQLList.new(var6)
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
					resolve = function() --[[ line: 240 ]]
						-- upvalues: error (copy)
						error(error("secretBackstory is secret."))
					end
				}
			}
		})
	end,
	interfaces = { var3 }
})
var5 = graphQLObjectType.new({
	name = "Droid",
	description = "A mechanical creature in the Star Wars universe.",
	fields = function() --[[ line: 266 ]]
		-- upvalues: map (ref), graphQLNonNull (ref), graphQLString (ref), graphQLList (ref), var3 (write), getFriends (ref), var6 (ref), error (ref)
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
					type = graphQLList.new(var3),
					resolve = function(p2) --[[ line: 287 ]]
						-- upvalues: getFriends (copy)
						return getFriends(p2)
					end
				}
			},
			{
				"appearsIn",
				{
					description = "Which movies they appear in.",
					type = graphQLList.new(var6)
				}
			},
			{
				"secretBackstory",
				{
					description = "Construction date and the name of the designer.",
					type = graphQLString,
					resolve = function() --[[ line: 304 ]]
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
	interfaces = { var3 }
})

return {
	StarWarsSchema = graphQLSchema.new({
		query = graphQLObjectType.new({
			name = "Query",
			fields = function() --[[ line: 337 ]]
				-- upvalues: map (ref), var3 (write), var6 (ref), getHero (ref), var4 (write), graphQLNonNull (ref), graphQLString (ref), getHuman (ref), var5 (write), getDroid (ref)
				return map.new({
					{
						"hero",
						{
							type = var3,
							args = {
								episode = {
									description = "If omitted, returns the hero of the whole saga. If provided, returns the hero of that particular episode.",
									type = var6
								}
							},
							resolve = function(_, p3) --[[ line: 349 ]]
								-- upvalues: getHero (copy)
								return getHero(p3.episode)
							end
						}
					},
					{
						"human",
						{
							type = var4,
							args = {
								id = {
									description = "id of the human",
									type = graphQLNonNull.new(graphQLString)
								}
							},
							resolve = function(_, p4) --[[ line: 364 ]]
								-- upvalues: getHuman (copy)
								return getHuman(p4.id)
							end
						}
					},
					{
						"droid",
						{
							type = var5,
							args = {
								id = {
									description = "id of the droid",
									type = graphQLNonNull.new(graphQLString)
								}
							},
							resolve = function(_, p5) --[[ line: 379 ]]
								-- upvalues: getDroid (copy)
								return getDroid(p5.id)
							end
						}
					}
				})
			end
		}),
		types = { var4, var5 }
	})
}