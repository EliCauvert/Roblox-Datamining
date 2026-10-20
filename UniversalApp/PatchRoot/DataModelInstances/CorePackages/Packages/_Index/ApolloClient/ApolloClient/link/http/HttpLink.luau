local ApolloLink = require(script.Parent.Parent.core).ApolloLink
local _ = require(script.Parent.selectHttpOptionsAndBody)
local CreateHttpLinkFunction = require(script.Parent.createHttpLink).createHttpLink
local self = setmetatable({}, { __index = ApolloLink })
self.__index = self

function self.new(Options)
	-- upvalues: ApolloLink (copy), CreateHttpLinkFunction (copy), self (copy)
	if Options == nil then
		Options = {}
	end
	local self1 = setmetatable(ApolloLink.new(CreateHttpLinkFunction(Options).request), self)
	self1.options = Options
	
	return self1
end

return { HttpLink = self }