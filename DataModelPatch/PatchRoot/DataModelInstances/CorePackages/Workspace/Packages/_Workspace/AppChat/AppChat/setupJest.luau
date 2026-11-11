local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local JestGlobalsModule = require(Parent.Dev.JestGlobals)
local AfterAllFunction: (any) -> () = JestGlobalsModule.afterAll
local Expect = JestGlobalsModule.expect
local CollisionMatchers2DModule = require(Parent.Dev.CollisionMatchers2D)
local GlobalMocksModule = require(AppChat.Tests.GlobalMocks)
JestGlobalsModule.beforeAll(function()
	-- upvalues: Expect (copy), CollisionMatchers2DModule (copy), GlobalMocksModule (copy)
	Expect.extend(CollisionMatchers2DModule.Jest)
	GlobalMocksModule.setup()
end)
AfterAllFunction(function()
	-- upvalues: GlobalMocksModule (copy)
	GlobalMocksModule.teardown()
end)