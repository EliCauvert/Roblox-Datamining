local HooksModule = {}
require(script.Parent.Parent.Parent.LuauPolyfill).Object.assign(HooksModule, require(script.useApolloClient), require(script.useQuery), require(script.useLazyQuery), require(script.useMutation), (require(script.useReactiveVar)))

return HooksModule