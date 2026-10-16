local PeopleReactView = script:FindFirstAncestor("PeopleReactView")
local Parent = PeopleReactView.Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local PeopleServiceModule = require(Parent.PeopleService)
local ConstantsModule = require(PeopleReactView.Constants)
local Button = FoundationModule.Button
local ButtonSize = FoundationModule.Enums.ButtonSize
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local View = FoundationModule.View
local UseTokensFunction = FoundationModule.Hooks.useTokens
local UseSignalStateFunction = require(Parent.SignalsReact).useSignalState

return function(Player: Player) --[[ Line: 28 | Named "PlatformNameSection" ]]
	-- upvalues: UseTokensFunction (copy), ReactModule (copy), PeopleServiceModule (copy), UseSignalStateFunction (copy), View (copy), ConstantsModule (copy), Button (copy), ButtonVariant (copy), ButtonSize (copy)
	local UseTokensResult = UseTokensFunction()
	local UseMemoResult = ReactModule.useMemo(function() --[[ Line: 31 ]]
		-- upvalues: PeopleServiceModule (upval)
		return PeopleServiceModule.getService("PeopleUtility")
	end, {})
	local UseMemoResult1 = ReactModule.useMemo(function() --[[ Line: 35 ]]
		-- upvalues: PeopleServiceModule (upval)
		return PeopleServiceModule.getService("PeopleListStore")
	end, {})
	local UseMemoResult2 = ReactModule.useMemo(function() --[[ Line: 44 ]]
		-- upvalues: UseMemoResult1 (copy), Player (copy)
		return UseMemoResult1.getPlatformProfileId(Player.UserId)
	end, { Player.UserId })
	local UseSignalStateResult: string = UseSignalStateFunction((ReactModule.useMemo(function() --[[ Line: 40 ]]
		-- upvalues: UseMemoResult1 (copy), Player (copy)
		return UseMemoResult1.getPlatformName(Player.UserId)
	end, { Player.UserId })))
	local UseSignalStateResult1 = UseSignalStateFunction(UseMemoResult2)
	local UseMemoResult3 = ReactModule.useMemo(function() --[[ Line: 52 ]]
		-- upvalues: UseMemoResult (copy), UseSignalStateResult1 (copy)
		return UseMemoResult.canShowPlatformProfile(UseSignalStateResult1)
	end, { UseSignalStateResult1 })
	local UseResult = ReactModule.useCallback(function() --[[ Line: 57 ]]
		-- upvalues: UseMemoResult (copy), UseSignalStateResult1 (copy)
		UseMemoResult.showPlatformProfile(UseSignalStateResult1)
	end, { UseSignalStateResult1 })
	local UseRefResult = ReactModule.useRef(nil)
	local UseResult1 = ReactModule.useCallback(function(Current) --[[ Line: 63 ]]
		-- upvalues: UseRefResult (copy), UseMemoResult3 (copy)
		UseRefResult.current = Current
		
		if Current and UseMemoResult3 then
			Current.NextSelectionLeft = Current
			Current.NextSelectionRight = nil
		end
	end, { UseMemoResult3 })
	local IsLengthAbove: boolean = UseSignalStateResult and (type(UseSignalStateResult) == "string" and string.len(UseSignalStateResult) > 0)
	
	return if IsLengthAbove then ReactModule.createElement(View, {
		tag = "row gap-xsmall align-y-center auto-x size-0-full",
		LayoutOrder = -1
	}, {
		PlatformIconContainer = ReactModule.createElement(View, { tag = "auto-xy", LayoutOrder = 1 }, {
			PlatformIcon = ReactModule.createElement("ImageLabel", {
				LayoutOrder = 1,
				BackgroundTransparency = 1,
				Image = ConstantsModule.PEOPLEPAGE.PERSON_ROW.PLATFORM_LOGO_IMAGE,
				Size = UDim2.fromOffset(UseTokensResult.Size.Size_900, UseTokensResult.Size.Size_900),
				ImageColor3 = UseTokensResult.Color.Content.Default.Color3
			})
		}),
		PlatformNameButton = ReactModule.createElement(Button, {
			LayoutOrder = 2,
			onActivated = UseResult,
			text = UseSignalStateResult,
			variant = ButtonVariant.Text,
			size = ButtonSize.Small,
			isDisabled = not UseMemoResult3,
			Selectable = UseMemoResult3,
			ref = UseResult1
		})
	}) else nil
end