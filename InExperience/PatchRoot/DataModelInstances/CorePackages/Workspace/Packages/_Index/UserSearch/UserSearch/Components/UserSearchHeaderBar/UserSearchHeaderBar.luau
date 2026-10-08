local parent = script:FindFirstAncestor("UserSearch").Parent
local reactModule = require(parent.React)
local UIBloxModule = require(parent.UIBlox)
local headerBar = UIBloxModule.App.Bar.HeaderBar
local iconButton = UIBloxModule.App.Button.IconButton
local images = UIBloxModule.App.ImageSet.Images
local appHeaderBarModule = require(parent.AppHeaderBar)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local userSearchHeaderInputModule = require(script.Parent.UserSearchHeaderInput)
local fFlagUserSearchGoBackOnCancel = require(parent.SharedFlags).FFlagUserSearchGoBackOnCancel

return function(p1)
	-- upvalues: useLocalization (ref), reactModule (ref), fFlagUserSearchGoBackOnCancel (ref), appHeaderBarModule (ref), userSearchHeaderInputModule (ref), iconButton (ref), images (ref), headerBar (ref)
	local searchKeyword = p1.searchKeyword
	local onSubmitSearch = p1.onSubmitSearch
	local onBackClick = p1.onBackClick
	local focusOnSearchInput = p1.focusOnSearchInput
	local headerHeight = p1.headerHeight
	local var1 = useLocalization({
		titleText = "Feature.AddFriends.Label.InputPlaceholder.SearchForPeopleAltCapitalization",
		placeholderText = "Feature.AddFriends.Label.InputPlaceholder.SearchForPeopleAltCapitalization",
		cancelText = "Feature.Chat.Action.Cancel"
	})
	local var2, var3 = reactModule.useState(true)
	local var4, var5 = reactModule.useState(focusOnSearchInput)
	local var6, var7 = reactModule.useState(searchKeyword)
	local var8 = reactModule.useCallback(function()
		-- upvalues: var3 (ref), var5 (ref)
		var3(true)
		var5(true)
	end, {})
	local var9 = reactModule.useCallback(function()
		-- upvalues: fFlagUserSearchGoBackOnCancel (copy), var7 (ref), onBackClick (ref), var3 (ref)
		if fFlagUserSearchGoBackOnCancel then
			var7("")
			onBackClick()
			
			return
		end
		var3(false)
		var7("")
	end, {
		if fFlagUserSearchGoBackOnCancel then onBackClick else nil
	})
	
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 0, headerHeight)
	}, {
		headerBar = reactModule.createElement(headerBar, {
			isSecondary = true,
			title = var1.titleText,
			renderLeft = reactModule.useMemo(function()
				-- upvalues: var2 (ref), appHeaderBarModule (copy), onBackClick (ref)
				return if var2 then function() end else appHeaderBarModule.makeBackButton(function()
					-- upvalues: onBackClick (copy)
					onBackClick()
				end)
			end, { var2, onBackClick }),
			renderCenter = reactModule.useCallback(function()
				-- upvalues: var2 (ref), reactModule (copy), userSearchHeaderInputModule (copy), var6 (ref), var1 (ref), var4 (ref), onSubmitSearch (ref), var9 (ref)
				return if var2 then reactModule.createElement(userSearchHeaderInputModule, {
					initialInputText = var6,
					searchPlaceholderText = var1.placeholderText,
					cancelText = var1.cancelText,
					captureFocusOnMount = var4,
					onSubmit = onSubmitSearch,
					onCancel = var9
				}) else nil
			end, {
				var2, searchKeyword, var4, onSubmitSearch, var9, var1.placeholderText,
				var1.cancelText
			}),
			renderRight = reactModule.useCallback(function()
				-- upvalues: var2 (ref), reactModule (copy), iconButton (copy), images (copy), var8 (ref)
				return if var2 then nil else reactModule.createElement(iconButton, {
					size = UDim2.fromOffset(0, 0),
					icon = images["icons/common/search"],
					onActivated = var8
				})
			end, { var2, var8 }),
			shouldHideSecondaryLeftItem = var2,
			barHeight = headerHeight,
			paddingTop = UDim.new(0, 0),
			paddingBottom = UDim.new(0, 0)
		})
	})
end