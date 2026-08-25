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

return function(p0)
	-- upvalues: useTokens (ref), reactModule (ref), peopleServiceModule (ref), useSignalState (ref), view (ref), constantsModule (ref), button (ref), buttonVariant (ref), buttonSize (ref)
	local var6 = useTokens()
	local var7 = reactModule.useMemo(function()
		-- upvalues: peopleServiceModule (copy)
		return peopleServiceModule.getService("PeopleUtility")
	end, {})
	local var8 = reactModule.useMemo(function()
		-- upvalues: peopleServiceModule (copy)
		return peopleServiceModule.getService("PeopleListStore")
	end, {})
	local var9 = useSignalState(reactModule.useMemo(function()
		-- upvalues: var8 (ref), p0 (ref)
		return var8.getPlatformName(p0.UserId)
	end, { p0.UserId }))
	local var10 = useSignalState(reactModule.useMemo(function()
		-- upvalues: var8 (ref), p0 (ref)
		return var8.getPlatformProfileId(p0.UserId)
	end, { p0.UserId }))
	local var11 = reactModule.useMemo(function()
		-- upvalues: var7 (ref), var10 (ref)
		return var7.canShowPlatformProfile(var10)
	end, { var10 })
	local var12 = reactModule.useRef(nil)
	
	return if var9 and (type(var9) == "string" and string.len(var9) > 0) then reactModule.createElement(view, {
		tag = "row gap-xsmall align-y-center auto-x size-0-full",
		LayoutOrder = -1
	}, {
		PlatformIconContainer = reactModule.createElement(view, { tag = "auto-xy", LayoutOrder = 1 }, {
			PlatformIcon = reactModule.createElement("ImageLabel", {
				LayoutOrder = 1,
				BackgroundTransparency = 1,
				Image = constantsModule.PEOPLEPAGE.PERSON_ROW.PLATFORM_LOGO_IMAGE,
				Size = UDim2.fromOffset(var6.Size.Size_900, var6.Size.Size_900),
				ImageColor3 = var6.Color.Content.Default.Color3
			})
		}),
		PlatformNameButton = reactModule.createElement(button, {
			LayoutOrder = 2,
			onActivated = reactModule.useCallback(function()
				-- upvalues: var7 (ref), var10 (ref)
				var7.showPlatformProfile(var10)
			end, { var10 }),
			text = var9,
			variant = buttonVariant.Text,
			size = buttonSize.Small,
			isDisabled = not var11,
			Selectable = var11,
			ref = reactModule.useCallback(function(p1)
				-- upvalues: var12 (ref), var11 (ref)
				var12.current = p1
				
				if p1 and var11 then
					p1.NextSelectionLeft = p1
					p1.NextSelectionRight = nil
				end
			end, { var11 })
		})
	}) else nil
end