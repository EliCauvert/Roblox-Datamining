local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local ReactModule = require(CorePackages.Packages.React)
local FFlagRenameDeprecatedUIBloxTokens = require(CorePackages.Workspace.Packages.SharedFlags).FFlagRenameDeprecatedUIBloxTokens
local UseDispatchFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch
local UseDesignTokensFunction = require(CorePackages.Workspace.Packages.Style).useDesignTokens
local SearchTypes = require(CorePackages.Workspace.Packages.RobloxAppEnums).SearchTypes
local SearchUuidModule = require(Modules.LuaApp.SearchUuid)
local SetSearchParametersModule = require(Modules.LuaApp.Actions.SetSearchParameters)
local TenFootUiSearchTypeSelectorModule = require(script.Parent.TenFootUiSearchTypeSelector)
local TenFootUiSearchBarModule = require(script.Parent.TenFootUiSearchBar)
local TenFootUiSearchExperiencesGridModule = require(script.Parent.TenFootUiSearchExperiencesGrid)
local TenFootUiSearchPlayersGridModule = require(script.Parent.TenFootUiSearchPlayersGrid)
local FocusNavigationEventNameEnum = require(CorePackages.Workspace.Packages.FocusNavigationUtils).FocusNavigationEventNameEnum
local ReactFocusNavigationModule = require(CorePackages.Packages.ReactFocusNavigation)
local InputHandlersModule = require(CorePackages.Packages.InputHandlers)
local UseNavigationPropsFunction = require(CorePackages.Workspace.Packages.RobloxAppNavigation).useNavigationProps

return function(_)
	-- upvalues: UseDispatchFunction (copy), UseDesignTokensFunction (copy), ReactModule (copy), UseNavigationPropsFunction (copy), SearchTypes (copy), SearchUuidModule (copy), FocusNavigationEventNameEnum (copy), ReactFocusNavigationModule (copy), InputHandlersModule (copy), SetSearchParametersModule (copy), FFlagRenameDeprecatedUIBloxTokens (copy), TenFootUiSearchBarModule (copy), TenFootUiSearchTypeSelectorModule (copy), TenFootUiSearchExperiencesGridModule (copy), TenFootUiSearchPlayersGridModule (copy)
	local UseDispatchResult = UseDispatchFunction()
	local UseDesignTokensResult = UseDesignTokensFunction()
	local UseStateResult, UseStateResult2 = ReactModule.useState("")
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState((UseNavigationPropsFunction(function(_, _, p1)
		-- upvalues: SearchTypes (upval)
		return p1.getParam("defaultSearchType", SearchTypes.Games)
	end)))
	local UseStateResult3, UseStateResult2_2 = ReactModule.useState(SearchUuidModule())
	local UseEventHandlerMapResult = ReactFocusNavigationModule.useEventHandlerMap(ReactModule.useMemo(function()
		-- upvalues: FocusNavigationEventNameEnum (upval), InputHandlersModule (upval), UseStateResult1 (copy), SearchTypes (upval), UseStateResult2_1 (copy)
		return {
			[FocusNavigationEventNameEnum.TabBackward] = {
				handler = InputHandlersModule.onRelease(function(_)
					-- upvalues: UseStateResult1 (upval), SearchTypes (upval), UseStateResult2_1 (upval)
					if UseStateResult1 ~= SearchTypes.Games then
						UseStateResult2_1(SearchTypes.Games)
					end
				end)
			},
			[FocusNavigationEventNameEnum.TabForward] = {
				handler = InputHandlersModule.onRelease(function(_)
					-- upvalues: UseStateResult1 (upval), SearchTypes (upval), UseStateResult2_1 (upval)
					if UseStateResult1 ~= SearchTypes.Players then
						UseStateResult2_1(SearchTypes.Players)
					end
				end)
			}
		}
	end, { UseStateResult1, UseStateResult2_1 }), (ReactFocusNavigationModule.useEventMap(ReactModule.useMemo(function()
		-- upvalues: FocusNavigationEventNameEnum (upval)
		return {
			[Enum.KeyCode.ButtonR1] = FocusNavigationEventNameEnum.TabForward,
			[Enum.KeyCode.ButtonL1] = FocusNavigationEventNameEnum.TabBackward
		}
	end, {}), (ReactModule.useRef(nil)))))
	ReactModule.useEffect(function()
		-- upvalues: UseStateResult (copy), UseDispatchResult (copy), SetSearchParametersModule (upval), UseStateResult3 (copy)
		UseDispatchResult(SetSearchParametersModule(UseStateResult3, {
			isKeywordSuggestionEnabled = false,
			searchKeyword = UseStateResult
		}))
	end, { UseStateResult, UseStateResult3 })
	
	local function OnSearchTypeSelected(SearchType)
		-- upvalues: UseStateResult1 (copy), SearchTypes (upval), UseStateResult2_1 (copy)
		if UseStateResult1 ~= SearchTypes.Games and UseStateResult1 ~= SearchTypes.Players then
			warn("Invalid search type: " .. tostring(SearchType))
		end
		if SearchType ~= UseStateResult1 then
			UseStateResult2_1(SearchType)
			
			return
		end
	end
	
	local Ref = ReactModule.createRef()
	ReactModule.useEffect(function()
		-- upvalues: Ref (copy)
		if Ref.current then
			Ref.current:CaptureFocus()
		end
	end, {})
	
	return ReactModule.createElement("Frame", {
		ZIndex = 2,
		BorderSizePixel = 0,
		Size = UDim2.new(1, 0, 1, 0),
		ref = UseEventHandlerMapResult,
		BackgroundTransparency = (if FFlagRenameDeprecatedUIBloxTokens then UseDesignTokensResult.Color.Common.Scrim else UseDesignTokensResult.Semantic.Color.Common.Overlay).Transparency,
		BackgroundColor3 = (if FFlagRenameDeprecatedUIBloxTokens then UseDesignTokensResult.Color.Common.Scrim else UseDesignTokensResult.Semantic.Color.Common.Overlay).Color3
	}, {
		Layout = ReactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			HorizontalAlignment = Enum.HorizontalAlignment.Center,
			SortOrder = Enum.SortOrder.LayoutOrder
		}),
		Padding = ReactModule.createElement("UIPadding", {
			PaddingLeft = UDim.new(0, UseDesignTokensResult.LuaApps.Search.SearchPaddingVertical),
			PaddingRight = UDim.new(0, UseDesignTokensResult.LuaApps.Search.SearchPaddingVertical),
			PaddingTop = UDim.new(0, UseDesignTokensResult.LuaApps.Search.SearchPaddingVertical)
		}),
		SearchBox = ReactModule.createElement(TenFootUiSearchBarModule, {
			layoutOrder = 1,
			textBoxRef = Ref,
			onFocused = function() end,
			onSubmitSearch = function(p1)
				-- upvalues: UseStateResult (copy), UseStateResult2_2 (copy), SearchUuidModule (upval), UseStateResult2 (copy)
				if p1.Text ~= UseStateResult then
					UseStateResult2_2(SearchUuidModule())
					UseStateResult2(p1.Text)
				end
			end
		}),
		SearchTypeSelector = ReactModule.createElement(TenFootUiSearchTypeSelectorModule, {
			layoutOrder = 2,
			onSearchTypeSelected = OnSearchTypeSelected,
			searchType = UseStateResult1
		}),
		ExperiencesGrid = ReactModule.createElement(TenFootUiSearchExperiencesGridModule, {
			layoutOrder = 3,
			searchType = UseStateResult1,
			searchUuid = UseStateResult3,
			searchKeyword = UseStateResult
		}),
		PlayersGrid = ReactModule.createElement(TenFootUiSearchPlayersGridModule, {
			layoutOrder = 4,
			searchType = UseStateResult1,
			searchKeyword = UseStateResult
		})
	})
end