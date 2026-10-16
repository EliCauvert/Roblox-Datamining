local HttpService = game:GetService("HttpService")
local Squads = script:FindFirstAncestor("Squads")
local Parent = Squads.Parent
local FFlagSquadsEnableFoundationTestIdsModule = require(Squads.Flags.FFlagSquadsEnableFoundationTestIds)
local DependenciesModule = require(Squads.dependencies)
local React = DependenciesModule.React
local Foundation = DependenciesModule.Foundation
local UseEffectOnceFunction = DependenciesModule.Hooks.useEffectOnce
local UseLocalizationFunction = DependenciesModule.Hooks.useLocalization
local Icon = Foundation.Icon
local Text = Foundation.Text
local View = Foundation.View
local IconSize = Foundation.Enums.IconSize
local UseTokensFunction = Foundation.Hooks.useTokens
local UseLocalUserIdFunction = require(Parent.RobloxAppHooks).useLocalUserId
local SquadExternalContractContext = require(Parent.SquadsCore.SquadExternalContractProvider).SquadExternalContractContext
local UseCurrentSquadMembersFunction = require(Parent.SquadsCore.Hooks).useCurrentSquadMembers
local EventNamesModule = require(Parent.SquadsCore.EventNames)
local SquadLobbyLuckyRecommendationModalModule = require(script.Parent.SquadLobbyLuckyRecommendationModal)

return function(_) --[[ Line: 32 | Named "SquadLobbyLuckyRecommendationRow" ]]
	-- upvalues: UseTokensFunction (copy), React (copy), UseLocalizationFunction (copy), UseLocalUserIdFunction (copy), SquadExternalContractContext (copy), UseCurrentSquadMembersFunction (copy), UseEffectOnceFunction (copy), EventNamesModule (copy), HttpService (copy), View (copy), FFlagSquadsEnableFoundationTestIdsModule (copy), Text (copy), Icon (copy), IconSize (copy), SquadLobbyLuckyRecommendationModalModule (copy)
	local UseTokensResult = UseTokensFunction()
	local UseStateResult, UseStateResult2 = React.useState(false)
	local UseLocalizationResult = UseLocalizationFunction({
		title = "Feature.Squads.Label.LuckyRecommendationRow",
		body = "Feature.Squads.Description.LuckyRecommendationRow"
	})
	local Number: number = tonumber(UseLocalUserIdFunction()) or 0
	local UseContextResult = React.useContext(SquadExternalContractContext)
	local UseCurrentSquadMembersResult = UseCurrentSquadMembersFunction()
	local UseRefResult = React.useRef(UseCurrentSquadMembersResult)
	UseRefResult.current = UseCurrentSquadMembersResult
	local UseRefResult1 = React.useRef("")
	UseEffectOnceFunction(function() --[[ Line: 48 ]]
		-- upvalues: UseContextResult (copy), EventNamesModule (upval), Number (copy)
		UseContextResult.fireSquadAnalytics(EventNamesModule.LuckyRecommendationRowImpression, { localUserId = Number, clientTimestamp = os.time() })
	end, true)
	local UseResult = React.useCallback(function() --[[ Line: 68 ]]
		-- upvalues: UseStateResult2 (copy)
		UseStateResult2(false)
	end, {})
	
	return React.createElement(React.Fragment, nil, {
		Row = React.createElement(View, { tag = "size-full-0 auto-y padding-x-xlarge" }, {
			Card = React.createElement(View, {
				tag = "row align-y-center gap-medium size-full-0 auto-y stroke-standard stroke-position-inner stroke-default radius-medium bg-surface-0 gui-object-defaults",
				padding = {
					left = UDim.new(0, UseTokensResult.Padding.XLarge),
					right = UDim.new(0, UseTokensResult.Padding.Medium),
					top = UDim.new(0, UseTokensResult.Padding.Large),
					bottom = UDim.new(0, UseTokensResult.Padding.Large)
				},
				onActivated = React.useCallback(function() --[[ Line: 55 ]]
					-- upvalues: HttpService (upval), UseRefResult1 (copy), UseRefResult (copy), UseContextResult (copy), EventNamesModule (upval), Number (copy), UseStateResult2 (copy)
					local Guid = HttpService:GenerateGUID(false)
					UseRefResult1.current = Guid
					local Current = UseRefResult.current
					UseContextResult.fireSquadAnalytics(EventNamesModule.LuckyRecommendationInvoked, {
						luckyRecommendationSessionId = Guid,
						localUserId = Number,
						squadMemberCount = if Current then #Current else 0,
						clientTimestamp = os.time()
					})
					UseStateResult2(true)
				end, { Number, UseContextResult }),
				testId = if FFlagSquadsEnableFoundationTestIdsModule then "--social-squad-lobby-lucky-recommendation-row" else nil
			}, {
				Content = React.createElement(View, { tag = "col fill gap-xsmall auto-y", LayoutOrder = 1 }, {
					Title = React.createElement(Text, {
						tag = "size-full-0 auto-y text-title-medium text-no-wrap text-align-x-left text-truncate-end content-emphasis",
						LayoutOrder = 1,
						Text = UseLocalizationResult.title,
						testId = if FFlagSquadsEnableFoundationTestIdsModule then "--social-squad-lobby-lucky-recommendation-row--title" else nil
					}),
					Body = React.createElement(Text, {
						tag = "size-full-0 auto-y text-body-medium text-no-wrap text-align-x-left text-truncate-end content-default",
						LayoutOrder = 2,
						Text = UseLocalizationResult.body,
						testId = if FFlagSquadsEnableFoundationTestIdsModule then "--social-squad-lobby-lucky-recommendation-row--body" else nil
					})
				}),
				Chevron = React.createElement(Icon, {
					LayoutOrder = 2,
					name = "chevron-large-right",
					size = IconSize.Small
				})
			})
		}),
		Modal = if UseStateResult then React.createElement(SquadLobbyLuckyRecommendationModalModule, { onClose = UseResult, sessionId = UseRefResult1.current }) else nil
	})
end