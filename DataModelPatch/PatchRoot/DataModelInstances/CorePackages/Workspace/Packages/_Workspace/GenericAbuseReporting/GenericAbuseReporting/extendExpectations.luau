local Parent = script:FindFirstAncestor("GenericAbuseReporting").Parent
local JestGlobalsModule = require(Parent.Dev.JestGlobals)
local Expect = JestGlobalsModule.expect
local CollisionMatchers2DModule = require(Parent.Dev.CollisionMatchers2D)
JestGlobalsModule.beforeAll(function()
	-- upvalues: Expect (copy), CollisionMatchers2DModule (copy)
	Expect.extend(CollisionMatchers2DModule.Jest)
end)