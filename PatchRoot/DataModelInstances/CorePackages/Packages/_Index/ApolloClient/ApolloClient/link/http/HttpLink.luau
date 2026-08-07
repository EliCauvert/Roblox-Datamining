-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:52:15 2026 Pacific Standard Time.

local t = {}
local apolloLink = require(script.Parent.Parent.core).ApolloLink
local _ = require(script.Parent.selectHttpOptionsAndBody)
local createHttpLink = require(script.Parent.createHttpLink).createHttpLink
local tbl = setmetatable({}, { __index = apolloLink })
tbl.__index = tbl

function tbl.new(p0) --[[ line: 23 ]]
	-- upvalues: apolloLink (ref), createHttpLink (ref), tbl (ref)
	if p0 == nil then
		p0 = {}
	end
	local tbl_1 = setmetatable(apolloLink.new(createHttpLink(p0).request), tbl)
	tbl_1.options = p0
	
	return tbl_1
end

t.HttpLink = tbl

return t