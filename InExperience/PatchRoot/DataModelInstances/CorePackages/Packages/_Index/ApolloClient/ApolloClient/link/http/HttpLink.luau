local t = {}
local apolloLink = require(script.Parent.Parent.core).ApolloLink
local _ = require(script.Parent.selectHttpOptionsAndBody)
local createHttpLink = require(script.Parent.createHttpLink).createHttpLink
local tbl = setmetatable({}, { __index = apolloLink })
tbl.__index = tbl

function tbl.new(p1)
	-- upvalues: apolloLink (ref), createHttpLink (ref), tbl (ref)
	if p1 == nil then
		p1 = {}
	end
	local tbl_1 = setmetatable(apolloLink.new(createHttpLink(p1).request), tbl)
	tbl_1.options = p1
	
	return tbl_1
end

t.HttpLink = tbl

return t