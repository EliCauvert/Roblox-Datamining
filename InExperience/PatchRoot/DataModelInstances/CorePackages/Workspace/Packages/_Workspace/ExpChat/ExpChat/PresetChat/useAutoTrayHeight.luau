local GuiService = game:GetService("GuiService")
local ExpChat = script:FindFirstAncestor("ExpChat")
local Parent = ExpChat.Parent
local ReactModule = require(Parent.React)
local SignalsReactModule = require(Parent.SignalsReact)
local ConfigModule = require(ExpChat.Config)
local GetPresetChatStoreModule = require(ExpChat.Stores.GetPresetChatStore)

local function getTopbarInsetTop() --[[ Line: 27 ]]
	-- upvalues: GuiService (copy)
	return GuiService.TopbarInset.Height
end

local function _(p1, p2, p3): number --[[ Line: 31 | Named "computeHeight" ]]
	-- upvalues: ConfigModule (copy)
	return (math.clamp(p1 - p2 - p3 - ConfigModule.PresetTray.ChatWindowPadding, ConfigModule.PresetTray.MinHeight, ConfigModule.PresetTray.MaxHeight))
end

return function() --[[ Line: 36 | Named "useAutoTrayHeight" ]]
	-- upvalues: GetPresetChatStoreModule (copy), SignalsReactModule (copy), ReactModule (copy), getTopbarInsetTop (copy), GuiService (copy), ConfigModule (copy)
	local UseSignalStateResult = SignalsReactModule.useSignalState(GetPresetChatStoreModule(false).getChatWindowBottomY)
	local UseStateResult, UseStateResult2 = ReactModule.useState(0)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(getTopbarInsetTop)
	ReactModule.useEffect(function() --[[ Line: 43 ]]
		-- upvalues: GuiService (upval), UseStateResult2_1 (copy)
		local Connection = GuiService:GetPropertyChangedSignal("TopbarInset"):Connect(function() --[[ Line: 44 ]]
			-- upvalues: UseStateResult2_1 (upval), GuiService (upval)
			UseStateResult2_1(GuiService.TopbarInset.Height)
		end)
		
		return function() --[[ Line: 47 ]]
			-- upvalues: Connection (copy)
			Connection:Disconnect()
		end
	end, {})
	
	return math.clamp(UseStateResult - UseStateResult1 - UseSignalStateResult - ConfigModule.PresetTray.ChatWindowPadding, ConfigModule.PresetTray.MinHeight, ConfigModule.PresetTray.MaxHeight), (ReactModule.useCallback(function(Frame) --[[ Line: 52 ]]
		-- upvalues: UseStateResult2 (copy)
		UseStateResult2(Frame.AbsoluteSize.Y)
	end, {}))
end