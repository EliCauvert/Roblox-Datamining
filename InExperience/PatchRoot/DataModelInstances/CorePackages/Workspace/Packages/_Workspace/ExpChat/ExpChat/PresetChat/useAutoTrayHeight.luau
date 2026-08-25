local guiService = game:GetService("GuiService")
local expChat = script:FindFirstAncestor("ExpChat")
local parent = expChat.Parent
local reactModule = require(parent.React)
local signalsReactModule = require(parent.SignalsReact)
local configModule = require(expChat.Config)
local getPresetChatStoreModule = require(expChat.Stores.GetPresetChatStore)

local function getTopbarInsetTop()
	-- upvalues: guiService (ref)
	return guiService.TopbarInset.Height
end

local function _(p0, p1, p2)
	-- upvalues: configModule (ref)
	return math.clamp(p0 - p1 - p2 - configModule.PresetTray.ChatWindowPadding, configModule.PresetTray.MinHeight, configModule.PresetTray.MaxHeight)
end

return function()
	-- upvalues: getPresetChatStoreModule (ref), signalsReactModule (ref), reactModule (ref), getTopbarInsetTop (ref), guiService (ref), configModule (ref)
	local var7 = signalsReactModule.useSignalState(getPresetChatStoreModule(false).getChatWindowBottomY)
	local var8, var9 = reactModule.useState(0)
	local var10, var11 = reactModule.useState(getTopbarInsetTop)
	reactModule.useEffect(function()
		-- upvalues: guiService (copy), var11 (ref)
		local var12 = guiService:GetPropertyChangedSignal("TopbarInset"):Connect(function()
			-- upvalues: var11 (copy), guiService (copy)
			var11(guiService.TopbarInset.Height)
		end)
		
		return function()
			-- upvalues: var12 (ref)
			var12:Disconnect()
		end
	end, {})
	
	return math.clamp(var8 - var10 - var7 - configModule.PresetTray.ChatWindowPadding, configModule.PresetTray.MinHeight, configModule.PresetTray.MaxHeight), reactModule.useCallback(function(p3)
		-- upvalues: var9 (ref)
		var9(p3.AbsoluteSize.Y)
	end, {})
end