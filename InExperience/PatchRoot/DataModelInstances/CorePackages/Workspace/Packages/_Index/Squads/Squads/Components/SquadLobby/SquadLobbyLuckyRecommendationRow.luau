local httpService = game:GetService("HttpService")
local squads = script:FindFirstAncestor("Squads")
local parent = squads.Parent
local dependenciesModule = require(squads.dependencies)
local react = dependenciesModule.React
local foundation = dependenciesModule.Foundation
local useEffectOnce = dependenciesModule.Hooks.useEffectOnce
local useLocalization = dependenciesModule.Hooks.useLocalization
local icon = foundation.Icon
local text = foundation.Text
local view = foundation.View
local iconSize = foundation.Enums.IconSize
local useTokens = foundation.Hooks.useTokens
local useLocalUserId = require(parent.RobloxAppHooks).useLocalUserId
local squadExternalContractContext = require(parent.SquadsCore.SquadExternalContractProvider).SquadExternalContractContext
local useCurrentSquadMembers = require(parent.SquadsCore.Hooks).useCurrentSquadMembers
local eventNamesModule = require(parent.SquadsCore.EventNames)
local squadLobbyLuckyRecommendationModalModule = require(script.Parent.SquadLobbyLuckyRecommendationModal)

return function(_) --[[ line: 28 | named "SquadLobbyLuckyRecommendationRow" ]]
	-- upvalues: useTokens (ref), react (ref), useLocalization (ref), useLocalUserId (ref), squadExternalContractContext (ref), useCurrentSquadMembers (ref), useEffectOnce (ref), eventNamesModule (ref), httpService (ref), view (ref), text (ref), icon (ref), iconSize (ref), squadLobbyLuckyRecommendationModalModule (ref)
	local var5 = useTokens()
	local var6, var7 = react.useState(false)
	local var8 = useLocalization({
		title = "Feature.Squads.Label.LuckyRecommendationRow",
		body = "Feature.Squads.Description.LuckyRecommendationRow"
	})
	local var9 = tonumber(useLocalUserId()) or 0
	local var10 = react.useContext(squadExternalContractContext)
	local var11 = useCurrentSquadMembers()
	local var12 = react.useRef(var11)
	var12.current = var11
	local var13 = react.useRef("")
	useEffectOnce(function() --[[ line: 44 ]]
		-- upvalues: var10 (ref), eventNamesModule (copy), var9 (ref)
		var10.fireSquadAnalytics(eventNamesModule.LuckyRecommendationRowImpression, { localUserId = var9, clientTimestamp = os.time() })
	end, true)
	
	return react.createElement(react.Fragment, nil, {
		Row = react.createElement(view, { tag = "size-full-0 auto-y padding-x-xlarge" }, {
			Card = react.createElement(view, {
				tag = "row align-y-center gap-medium size-full-0 auto-y stroke-standard stroke-position-inner stroke-default radius-medium bg-surface-0 gui-object-defaults",
				padding = {
					left = UDim.new(0, var5.Padding.XLarge),
					right = UDim.new(0, var5.Padding.Medium),
					top = UDim.new(0, var5.Padding.Large),
					bottom = UDim.new(0, var5.Padding.Large)
				},
				onActivated = react.useCallback(function() --[[ line: 51 ]]
					-- upvalues: httpService (copy), var13 (ref), var12 (ref), var10 (ref), eventNamesModule (copy), var9 (ref), var7 (ref)
					local var14 = httpService:GenerateGUID(false)
					var13.current = var14
					local current = var12.current
					var10.fireSquadAnalytics(eventNamesModule.LuckyRecommendationInvoked, {
						luckyRecommendationSessionId = var14,
						localUserId = var9,
						squadMemberCount = if current then #current else 0,
						clientTimestamp = os.time()
					})
					var7(true)
				end, { var9, var10 })
			}, {
				Content = react.createElement(view, { tag = "col fill gap-xsmall auto-y", LayoutOrder = 1 }, {
					Title = react.createElement(text, {
						tag = "size-full-0 auto-y text-title-medium text-no-wrap text-align-x-left text-truncate-end content-emphasis",
						LayoutOrder = 1,
						Text = var8.title
					}),
					Body = react.createElement(text, {
						tag = "size-full-0 auto-y text-body-medium text-no-wrap text-align-x-left text-truncate-end content-default",
						LayoutOrder = 2,
						Text = var8.body
					})
				}),
				Chevron = react.createElement(icon, {
					LayoutOrder = 2,
					name = "chevron-large-right",
					size = iconSize.Small
				})
			})
		}),
		Modal = if var6 then react.createElement(squadLobbyLuckyRecommendationModalModule, {
			onClose = react.useCallback(function() --[[ line: 64 ]]
				-- upvalues: var7 (ref)
				var7(false)
			end, {}),
			sessionId = var13.current
		}) else nil
	})
end