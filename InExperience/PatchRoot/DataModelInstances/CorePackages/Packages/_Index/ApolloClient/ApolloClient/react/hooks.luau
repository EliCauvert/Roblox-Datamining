local t = {}
require(script.Parent.Parent.Parent.LuauPolyfill).Object.assign(t, require(script.useApolloClient), require(script.useQuery), require(script.useLazyQuery), require(script.useMutation), require(script.useReactiveVar))

return t