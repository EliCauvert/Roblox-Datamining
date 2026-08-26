local parent = script.Parent.Parent.Parent
local boolean = require(parent.Parent.LuauPolyfill).Boolean
local t = {}
local invariantError = require(parent.jsutils.invariant).InvariantError

function t.checkFetcher(p1)
	-- upvalues: boolean (ref), invariantError (ref)
	if not boolean.toJSBoolean(p1) and typeof(_G.fetch) == "nil" then
		error(invariantError.new("\n\"fetch\" has not been found globally and no fetcher has been configured. To fix this, install a fetch package (like https://www.npmjs.com/package/cross-fetch), instantiate the fetcher, and pass it into your HttpLink constructor. For example:\n\nimport fetch from 'cross-fetch';\nimport { ApolloClient, HttpLink } from '@apollo/client';\nconst client = new ApolloClient({\n  link: new HttpLink({ uri: '/graphql', fetch })\n});\n    "))
	end
end

return t