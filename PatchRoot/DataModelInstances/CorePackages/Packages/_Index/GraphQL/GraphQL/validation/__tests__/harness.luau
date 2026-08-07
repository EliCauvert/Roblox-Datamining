-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:42:38 2026 Pacific Standard Time.

local parent = script.Parent.Parent
local parent_1 = parent.Parent
local array = require(parent_1.Parent.LuauPolyfill).Array
local parse = require(parent_1.language.parser).parse
local _ = require(parent_1.type.schema)
local buildSchema = require(parent_1.utilities.buildASTSchema).buildSchema
local validateModule = require(parent.validate)
local validate = validateModule.validate
local validateSDL = validateModule.validateSDL
local var1 = buildSchema("  interface Being {\n    name(surname: Boolean): String\n  }\n\n  interface Mammal {\n    mother: Mammal\n    father: Mammal\n  }\n\n  interface Pet implements Being {\n    name(surname: Boolean): String\n  }\n\n  interface Canine implements Mammal & Being {\n    name(surname: Boolean): String\n    mother: Canine\n    father: Canine\n  }\n\n  enum DogCommand {\n    SIT\n    HEEL\n    DOWN\n  }\n\n  type Dog implements Being & Pet & Mammal & Canine {\n    name(surname: Boolean): String\n    nickname: String\n    barkVolume: Int\n    barks: Boolean\n    doesKnowCommand(dogCommand: DogCommand): Boolean\n    isHouseTrained(atOtherHomes: Boolean = true): Boolean\n    isAtLocation(x: Int, y: Int): Boolean\n    mother: Dog\n    father: Dog\n  }\n\n  type Cat implements Being & Pet {\n    name(surname: Boolean): String\n    nickname: String\n    meows: Boolean\n    meowsVolume: Int\n    furColor: FurColor\n  }\n\n  union CatOrDog = Cat | Dog\n\n  interface Intelligent {\n    iq: Int\n  }\n\n  type Human implements Being & Intelligent {\n    name(surname: Boolean): String\n    pets: [Pet]\n    relatives: [Human]\n    iq: Int\n  }\n\n  type Alien implements Being & Intelligent {\n    name(surname: Boolean): String\n    numEyes: Int\n    iq: Int\n  }\n\n  union DogOrHuman = Dog | Human\n\n  union HumanOrAlien = Human | Alien\n\n  enum FurColor {\n    BROWN\n    BLACK\n    TAN\n    SPOTTED\n    NO_FUR\n    UNKNOWN\n  }\n\n  input ComplexInput {\n    requiredField: Boolean!\n    nonNullField: Boolean! = false\n    intField: Int\n    stringField: String\n    booleanField: Boolean\n    stringListField: [String]\n  }\n\n  type ComplicatedArgs {\n    # TODO List\n    # TODO Coercion\n    # TODO NotNulls\n    intArgField(intArg: Int): String\n    nonNullIntArgField(nonNullIntArg: Int!): String\n    stringArgField(stringArg: String): String\n    booleanArgField(booleanArg: Boolean): String\n    enumArgField(enumArg: FurColor): String\n    floatArgField(floatArg: Float): String\n    idArgField(idArg: ID): String\n    stringListArgField(stringListArg: [String]): String\n    stringListNonNullArgField(stringListNonNullArg: [String!]): String\n    complexArgField(complexArg: ComplexInput): String\n    multipleReqs(req1: Int!, req2: Int!): String\n    nonNullFieldWithDefault(arg: Int! = 0): String\n    multipleOpts(opt1: Int = 0, opt2: Int = 0): String\n    multipleOptAndReq(req1: Int!, req2: Int!, opt1: Int = 0, opt2: Int = 0): String\n  }\n\n  type QueryRoot {\n    human(id: ID): Human\n    alien: Alien\n    dog: Dog\n    cat: Cat\n    pet: Pet\n    catOrDog: CatOrDog\n    dogOrHuman: DogOrHuman\n    humanOrAlien: HumanOrAlien\n    complicatedArgs: ComplicatedArgs\n  }\n\n  schema {\n    query: QueryRoot\n  }\n\n  directive @onQuery on QUERY\n  directive @onMutation on MUTATION\n  directive @onSubscription on SUBSCRIPTION\n  directive @onField on FIELD\n  directive @onFragmentDefinition on FRAGMENT_DEFINITION\n  directive @onFragmentSpread on FRAGMENT_SPREAD\n  directive @onInlineFragment on INLINE_FRAGMENT\n  directive @onVariableDefinition on VARIABLE_DEFINITION\n")

local function expectValidationErrorsWithSchema(p0, p1, p2, p3) --[[ line: 161 ]]
	-- upvalues: parse (ref), validate (ref), array (ref)
	return p0(array.map(validate(p1, parse(p3), { p2 }), function(p4) --[[ line: 171 ]]
		return { message = p4.message, locations = p4.locations }
	end))
end

return {
	testSchema = var1,
	expectValidationErrorsWithSchema = expectValidationErrorsWithSchema,
	expectValidationErrors = function(p5, p6, p7) --[[ line: 180 ]]
		-- upvalues: expectValidationErrorsWithSchema (ref), var1 (ref)
		return expectValidationErrorsWithSchema(p5, var1, p6, p7)
	end,
	expectSDLValidationErrors = function(p8, p9, p10, p11) --[[ line: 184 ]]
		-- upvalues: parse (ref), validateSDL (ref), array (ref)
		return p8(array.map(validateSDL(parse(p11), p9, { p10 }), function(p12) --[[ line: 189 ]]
			return { message = p12.message, locations = p12.locations }
		end))
	end
}