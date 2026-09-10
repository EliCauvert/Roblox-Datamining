local momentsCreation = script:FindFirstAncestor("MomentsCreation")
local parent = momentsCreation.Parent
local builderIconsModule = require(parent.BuilderIcons)
local dashModule = require(parent.Dash)
local reactModule = require(parent.React)
local signalsModule = require(parent.Signals)
local signalsReactModule = require(parent.SignalsReact)
local useCallback = reactModule.useCallback
local useMemo = reactModule.useMemo
local useSignalState = signalsReactModule.useSignalState
local _ = require(momentsCreation.Types.CreationFlowTypes)
local _ = require(parent.MomentsTypes)
local list = {
	Enum.TextXAlignment.Center,
	Enum.TextXAlignment.Left,
	Enum.TextXAlignment.Right
}
local t = {
	[Enum.TextXAlignment.Left.Name] = builderIconsModule.Icon.FourBarsHorizontalRightAligned,
	[Enum.TextXAlignment.Center.Name] = builderIconsModule.Icon.FourBarsHorizontalCenterAligned,
	[Enum.TextXAlignment.Right.Name] = builderIconsModule.Icon.FourBarsHorizontalLeftAligned
}

local function _(p1)
	-- upvalues: list (ref)
	for i, v in list do
		if v == p1 then
			return list[i % #list + 1]
		end
	end
	return Enum.TextXAlignment.Center
end

return function(value)
	-- upvalues: useMemo (ref), signalsModule (ref), useSignalState (ref), useCallback (ref), list (ref), dashModule (ref), t (ref), builderIconsModule (ref)
	return {
		icon = t[useSignalState(useMemo(function()
			-- upvalues: signalsModule (copy), value (ref)
			return signalsModule.createComputed(function(p2)
				-- upvalues: value (copy)
				local activeSession = value.getActiveSession(p2)
				local var1 = if activeSession ~= nil then nil else activeSession.getDraft(p2)
				local var2 = var1 and var1[1]
				
				return if var2 == nil then Enum.TextXAlignment.Center else var2.textOverlayStyle.textXAlignment
			end)
		end, { value })).Name] or builderIconsModule.Icon.FourBarsHorizontalCenterAligned,
		onActivated = useCallback(function()
			-- upvalues: value (ref), list (copy), dashModule (copy)
			local activeSession = value.getActiveSession(false)
			
			if activeSession == nil then return end
			local draft = activeSession.getDraft(false)
			local var1 = draft and draft[1]
			
			if var1 == nil then return end
			local center
			local textXAlignment = var1.textOverlayStyle.textXAlignment
			
			for i, v in list do
				if v == textXAlignment then
					center = list[i % #list + 1]
					activeSession.update({
						dashModule.joinDeep(var1, { textOverlayStyle = { textXAlignment = center } })
					})
					
					return
				end
			end
			center = Enum.TextXAlignment.Center
		end, { value })
	}
end