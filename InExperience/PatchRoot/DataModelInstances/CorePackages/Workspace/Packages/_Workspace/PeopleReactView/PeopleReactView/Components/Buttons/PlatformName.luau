local peopleReactView = script:FindFirstAncestor("PeopleReactView")
local parent = peopleReactView.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local peopleServiceModule = require(parent.PeopleService)
local signalsReactModule = require(parent.SignalsReact)
local constantsModule = require(peopleReactView.Constants)
local button = foundationModule.Button
local buttonSize = foundationModule.Enums.ButtonSize
local buttonVariant = foundationModule.Enums.ButtonVariant
local view = foundationModule.View
local useTokens = foundationModule.Hooks.useTokens
local useSignalState = signalsReactModule.useSignalState

return function(p1)
	-- upvalues: useTokens (ref), reactModule (ref), peopleServiceModule (ref), useSignalState (ref), view (ref), constantsModule (ref), button (ref), buttonVariant (ref), buttonSize (ref)
	local var1 = useTokens()
	local var2 = reactModule.useMemo(function()
		-- upvalues: peopleServiceModule (copy)
		return peopleServiceModule.getService("PeopleUtility")
	end, {})
	local var3 = reactModule.useMemo(function()
		-- upvalues: peopleServiceModule (copy)
		return peopleServiceModule.getService("PeopleListStore")
	end, {})
	local var4 = useSignalState(reactModule.useMemo(function()
		-- upvalues: var3 (ref), p1 (ref)
		return var3.getPlatformName(p1.UserId)
	end, { p1.UserId }))
	local var5 = useSignalState(reactModule.useMemo(function()
		-- upvalues: var3 (ref), p1 (ref)
		return var3.getPlatformProfileId(p1.UserId)
	end, { p1.UserId }))
	local var6 = reactModule.useMemo(function()
		-- upvalues: var2 (ref), var5 (ref)
		return var2.canShowPlatformProfile(var5)
	end, { var5 })
	local var7 = reactModule.useRef(nil)
	
	return if var4 and (type(var4) == "string" and string.len(var4) > 0) then reactModule.createElement(view, {
		tag = "row gap-xsmall align-y-center auto-x size-0-full",
		LayoutOrder = -1
	}, {
		PlatformIconContainer = reactModule.createElement(view, { tag = "auto-xy", LayoutOrder = 1 }, {
			PlatformIcon = reactModule.createElement("ImageLabel", {
				LayoutOrder = 1,
				BackgroundTransparency = 1,
				Image = constantsModule.PEOPLEPAGE.PERSON_ROW.PLATFORM_LOGO_IMAGE,
				Size = UDim2.fromOffset(var1.Size.Size_900, var1.Size.Size_900),
				ImageColor3 = var1.Color.Content.Default.Color3
			})
		}),
		PlatformNameButton = reactModule.createElement(button, {
			LayoutOrder = 2,
			onActivated = reactModule.useCallback(function()
				-- upvalues: var2 (ref), var5 (ref)
				var2.showPlatformProfile(var5)
			end, { var5 }),
			text = var4,
			variant = buttonVariant.Text,
			size = buttonSize.Small,
			isDisabled = not var6,
			Selectable = var6,
			ref = reactModule.useCallback(function(p2)
				-- upvalues: var7 (ref), var6 (ref)
				var7.current = p2
				
				if p2 and var6 then
					p2.NextSelectionLeft = p2
					p2.NextSelectionRight = nil
				end
			end, { var6 })
		})
	}) else nil
end