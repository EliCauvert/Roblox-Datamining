-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:52:15 2026 Pacific Standard Time.

local parent = script.Parent.Parent.Parent
local boolean = require(parent.Parent.LuauPolyfill).Boolean
local t = {}
local invariantError = require(parent.jsutils.invariant).InvariantError

function t.checkFetcher(p0) --[[ line: 22 ]]
	-- upvalues: boolean (ref), invariantError (ref)
	if not boolean.toJSBoolean(p0) and typeof(_G.fetch) == "nil" then
		error(invariantError.new("\n\"fetch\" has not been found globally and no fetcher has been configured. To fix this, install a fetch package (like https://www.npmjs.com/package/cross-fetch), instantiate the fetcher, and pass it into your HttpLink constructor. For example:\n\nimport fetch from 'cross-fetch';\nimport { ApolloClient, HttpLink } from '@apollo/client';\nconst client = new ApolloClient({\n  link: new HttpLink({ uri: '/graphql', fetch })\n});\n    "))
	end
end

return t