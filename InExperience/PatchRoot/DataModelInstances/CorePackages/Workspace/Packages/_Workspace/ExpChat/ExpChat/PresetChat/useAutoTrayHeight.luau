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

local function _(p1, p2, p3)
	-- upvalues: configModule (ref)
	return math.clamp(p1 - p2 - p3 - configModule.PresetTray.ChatWindowPadding, configModule.PresetTray.MinHeight, configModule.PresetTray.MaxHeight)
end

return function()
	-- upvalues: getPresetChatStoreModule (ref), signalsReactModule (ref), reactModule (ref), getTopbarInsetTop (ref), guiService (ref), configModule (ref)
	local var1 = signalsReactModule.useSignalState(getPresetChatStoreModule(false).getChatWindowBottomY)
	local var2, var3 = reactModule.useState(0)
	local var4, var5 = reactModule.useState(getTopbarInsetTop)
	reactModule.useEffect(function()
		-- upvalues: guiService (copy), var5 (ref)
		local var6 = guiService:GetPropertyChangedSignal("TopbarInset"):Connect(function()
			-- upvalues: var5 (copy), guiService (copy)
			var5(guiService.TopbarInset.Height)
		end)
		
		return function()
			-- upvalues: var6 (ref)
			var6:Disconnect()
		end
	end, {})
	
	return math.clamp(var2 - var4 - var1 - configModule.PresetTray.ChatWindowPadding, configModule.PresetTray.MinHeight, configModule.PresetTray.MaxHeight), reactModule.useCallback(function(p1)
		-- upvalues: var3 (ref)
		var3(p1.AbsoluteSize.Y)
	end, {})
end