local momentsCreation = script:FindFirstAncestor("MomentsCreation")
local parent = momentsCreation.Parent
local dashModule = require(parent.Dash)
local foundationModule = require(parent.Foundation)
local momentsCommonModule = require(parent.MomentsCommon)
local reactModule = require(parent.React)
local signalsModule = require(parent.Signals)
local signalsReactModule = require(parent.SignalsReact)
local view = foundationModule.View
local useMemo = reactModule.useMemo
local useSignalState = signalsReactModule.useSignalState
local useTokens = foundationModule.Hooks.useTokens
local useFormFactor = momentsCommonModule.Hooks.useFormFactor
local formFactor = momentsCommonModule.Enums.FormFactor
local _ = require(momentsCreation.Types.CreationFlowTypes)
local _ = require(parent.MomentsTypes)
local list = {
	Color3.fromHex("000000"), Color3.fromHex("E75750"), Color3.fromHex("F57630"),
	Color3.fromHex("DBA61F"), Color3.fromHex("0C9B5A"), Color3.fromHex("16A9C7"),
	Color3.fromHex("528BFF"), Color3.fromHex("A766F5"), Color3.fromHex("D540F5"),
	Color3.fromHex("E74E90")
}

return function(p1)
	-- upvalues: useTokens (ref), useFormFactor (ref), formFactor (ref), useMemo (ref), signalsModule (ref), useSignalState (ref), dashModule (ref), list (ref), reactModule (ref), view (ref), foundationModule (ref)
	local controller = p1.controller
	local var1 = useTokens()
	local var2 = useFormFactor() == formFactor.Wide
	local var3 = useSignalState(useMemo(function()
		-- upvalues: signalsModule (copy), controller (ref)
		return signalsModule.createComputed(function(p2)
			-- upvalues: controller (copy)
			local activeSession = controller.getActiveSession(p2)
			local var4 = if activeSession ~= nil then nil else activeSession.getDraft(p2)
			local var5 = var4 and var4[1]
			
			return if var5 == nil then Color3.new(0, 0, 0) else var5.textOverlayStyle.fontColor
		end)
	end, { controller }))
	
	local function onSwatchActivated(p2)
		-- upvalues: controller (ref), dashModule (copy)
		local activeSession = controller.getActiveSession(false)
		
		if activeSession == nil then return end
		local draft = activeSession.getDraft(false)
		local var4 = draft and draft[1]
		
		if var4 == nil then
			return
		end
		activeSession.update({
			dashModule.joinDeep(var4, { textOverlayStyle = { fontColor = p2 } })
		})
	end
	
	local t = {}
	
	for i, v in list do
		t["Swatch" .. i] = reactModule.createElement(view, {
			tag = "radius-circle",
			LayoutOrder = i,
			Size = UDim2.fromOffset(32, 32),
			backgroundStyle = { Color3 = v },
			onActivated = function()
				-- upvalues: onSwatchActivated (ref), v (ref)
				onSwatchActivated(v)
			end,
			stroke = {
				Thickness = 3,
				Color = var1.Color.System.Contrast.Color3,
				Transparency = if var3 == v then 0 else 0.8
			}
		})
	end
	return reactModule.createElement(foundationModule.ScrollView, {
		LayoutOrder = p1.LayoutOrder,
		Size = UDim2.new(1, 0, 0, 40),
		scroll = {
			scrollBarVisibility = foundationModule.Enums.Visibility.None,
			ScrollingDirection = Enum.ScrollingDirection.X,
			AutomaticCanvasSize = Enum.AutomaticSize.X
		}
	}, {
		Row = reactModule.createElement(view, {
			tag = {
				["row align-y-center gap-medium size-0-full auto-x padding-x-large"] = true,
				["position-top-center anchor-top-center"] = var2
			}
		}, t)
	})
end