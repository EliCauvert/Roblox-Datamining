local Parent = script:FindFirstAncestor("UserSearch").Parent
local ReactModule = require(Parent.React)
local UIBloxModule = require(Parent.UIBlox)
local HeaderBar = UIBloxModule.App.Bar.HeaderBar
local IconButton = UIBloxModule.App.Button.IconButton
local Images = UIBloxModule.App.ImageSet.Images
local AppHeaderBarModule = require(Parent.AppHeaderBar)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local UserSearchHeaderInputModule = require(script.Parent.UserSearchHeaderInput)
local FFlagUserSearchGoBackOnCancel = require(Parent.SharedFlags).FFlagUserSearchGoBackOnCancel

return function(p1) --[[ Line: 28 | Named "UserSearchHeaderBar" ]]
	-- upvalues: UseLocalizationFunction (copy), ReactModule (copy), FFlagUserSearchGoBackOnCancel (copy), AppHeaderBarModule (copy), UserSearchHeaderInputModule (copy), IconButton (copy), Images (copy), HeaderBar (copy)
	local SearchKeyword = p1.searchKeyword
	local OnSubmitSearch = p1.onSubmitSearch
	local OnBackClickFunction = p1.onBackClick
	local FocusOnSearchInput = p1.focusOnSearchInput
	local HeaderHeight = p1.headerHeight
	local UseLocalizationResult = UseLocalizationFunction({
		titleText = "Feature.AddFriends.Label.InputPlaceholder.SearchForPeopleAltCapitalization",
		placeholderText = "Feature.AddFriends.Label.InputPlaceholder.SearchForPeopleAltCapitalization",
		cancelText = "Feature.Chat.Action.Cancel"
	})
	local UseStateResult, UseStateResult2 = ReactModule.useState(true)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(FocusOnSearchInput)
	local UseStateResult3, UseStateResult2_2 = ReactModule.useState(SearchKeyword)
	local UseResult = ReactModule.useCallback(function() --[[ Line: 45 ]]
		-- upvalues: UseStateResult2 (copy), UseStateResult2_1 (copy)
		UseStateResult2(true)
		UseStateResult2_1(true)
	end, {})
	local UseResult1 = ReactModule.useCallback(function() --[[ Line: 50 ]]
		-- upvalues: FFlagUserSearchGoBackOnCancel (upval), UseStateResult2_2 (copy), OnBackClickFunction (copy), UseStateResult2 (copy)
		if FFlagUserSearchGoBackOnCancel then
			UseStateResult2_2("")
			OnBackClickFunction()
			
			return
		else
			UseStateResult2(false)
			UseStateResult2_2("")
		end
	end, {
		if FFlagUserSearchGoBackOnCancel then OnBackClickFunction else nil
	})
	
	return ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 0, HeaderHeight)
	}, {
		headerBar = ReactModule.createElement(HeaderBar, {
			isSecondary = true,
			title = UseLocalizationResult.titleText,
			renderLeft = ReactModule.useMemo(function() --[[ Line: 60 ]]
				-- upvalues: UseStateResult (copy), AppHeaderBarModule (upval), OnBackClickFunction (copy)
				return if UseStateResult then function() --[[ Line: 62 ]] end else AppHeaderBarModule.makeBackButton(function() --[[ Line: 64 ]]
					-- upvalues: OnBackClickFunction (upval)
					OnBackClickFunction()
				end)
			end, { UseStateResult, OnBackClickFunction }),
			renderCenter = ReactModule.useCallback(function() --[[ Line: 70 ]]
				-- upvalues: UseStateResult (copy), ReactModule (upval), UserSearchHeaderInputModule (upval), UseStateResult3 (copy), UseLocalizationResult (copy), UseStateResult1 (copy), OnSubmitSearch (copy), UseResult1 (copy)
				return if UseStateResult then ReactModule.createElement(UserSearchHeaderInputModule, {
					initialInputText = UseStateResult3,
					searchPlaceholderText = UseLocalizationResult.placeholderText,
					cancelText = UseLocalizationResult.cancelText,
					captureFocusOnMount = UseStateResult1,
					onSubmit = OnSubmitSearch,
					onCancel = UseResult1
				}) else nil
			end, {
				UseStateResult, SearchKeyword, UseStateResult1, OnSubmitSearch, UseResult1,
				UseLocalizationResult.placeholderText, UseLocalizationResult.cancelText
			}),
			renderRight = ReactModule.useCallback(function() --[[ Line: 94 ]]
				-- upvalues: UseStateResult (copy), ReactModule (upval), IconButton (upval), Images (upval), UseResult (copy)
				return if UseStateResult then nil else ReactModule.createElement(IconButton, {
					size = UDim2.fromOffset(0, 0),
					icon = Images["icons/common/search"],
					onActivated = UseResult
				})
			end, { UseStateResult, UseResult }),
			shouldHideSecondaryLeftItem = UseStateResult,
			barHeight = HeaderHeight,
			paddingTop = UDim.new(0, 0),
			paddingBottom = UDim.new(0, 0)
		})
	})
end