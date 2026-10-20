local TextChatService = game:GetService("TextChatService")
local ExpChat = script:FindFirstAncestor("ExpChat")
local Actions = ExpChat.Actions
local BubbleChatSettingsChangedModule = require(Actions.BubbleChatSettingsChanged)
local BubbleChatChildSettingChangedModule = require(Actions.BubbleChatChildSettingChanged)
local BubbleChatChildRemovedModule = require(Actions.BubbleChatChildRemoved)
local GetSetUpBubbleChatConfigurationChildPropertiesModule = require(ExpChat.Flags.getSetUpBubbleChatConfigurationChildProperties)
local DefaultBubbleChatChildrenCustomizationProperties = require(ExpChat.Config).DefaultBubbleChatChildrenCustomizationProperties
local ClassNames = { "ImageLabel", "UIGradient", "UICorner", "UIPadding" }

local function getSettingsFromInstance(ClassName)
	-- upvalues: DefaultBubbleChatChildrenCustomizationProperties (copy)
	local t = {}
	
	for i, _ in pairs(DefaultBubbleChatChildrenCustomizationProperties[ClassName.ClassName]) do
		if ClassName[i] ~= nil then
			t[i] = ClassName[i]
		end
	end
	return t
end

local function connectPropertyChangedSignalsToInstance(p1, ClassName)
	-- upvalues: DefaultBubbleChatChildrenCustomizationProperties (copy), BubbleChatChildSettingChangedModule (copy)
	local List = {}
	
	for PropertyName, _ in pairs(DefaultBubbleChatChildrenCustomizationProperties[ClassName.ClassName]) do
		if ClassName[PropertyName] ~= nil then
			table.insert(List, (ClassName:GetPropertyChangedSignal(PropertyName):Connect(function()
				-- upvalues: p1 (copy), BubbleChatChildSettingChangedModule (upval), ClassName (copy), PropertyName (copy)
				p1:dispatch(BubbleChatChildSettingChangedModule(ClassName.ClassName, PropertyName, ClassName[PropertyName]))
			end)))
		end
	end
	return List
end

local function _(Connections)
	if Connections then
		for _, connection in ipairs(Connections) do
			connection:Disconnect()
		end
	end
end

local _ = function(p2): boolean
	-- upvalues: ClassNames (copy)
	for _, className in ipairs(ClassNames) do
		if className == p2.ClassName then
			return true
		end
	end
	return false
end

return function(p3)
	-- upvalues: TextChatService (copy), GetSetUpBubbleChatConfigurationChildPropertiesModule (copy), DefaultBubbleChatChildrenCustomizationProperties (copy), getSettingsFromInstance (copy), connectPropertyChangedSignalsToInstance (copy), ClassNames (copy), BubbleChatChildRemovedModule (copy), BubbleChatSettingsChangedModule (copy)
	local BubbleChatConfiguration = TextChatService:FindFirstChildOfClass("BubbleChatConfiguration")
	
	if BubbleChatConfiguration == nil or GetSetUpBubbleChatConfigurationChildPropertiesModule() == false then
		return DefaultBubbleChatChildrenCustomizationProperties
	end
	local t = {}
	local t1 = {}
	assert(BubbleChatConfiguration ~= nil, "BubbleChatConfiguration cannot be nil.")
	
	for _, value in ipairs({
		BubbleChatConfiguration:FindFirstChildOfClass("ImageLabel"),
		BubbleChatConfiguration:FindFirstChildOfClass("UIGradient"),
		BubbleChatConfiguration:FindFirstChildOfClass("UICorner"),
		(BubbleChatConfiguration:FindFirstChildOfClass("UIPadding"))
	}) do
		if value then
			t[value.ClassName] = getSettingsFromInstance(value)
			t1[value.ClassName] = connectPropertyChangedSignalsToInstance(p3, value)
		end
	end
	BubbleChatConfiguration.ChildRemoved:Connect(function(Child)
		-- upvalues: ClassNames (upval), t1 (copy), p3 (copy), BubbleChatChildRemovedModule (upval), BubbleChatConfiguration (copy), getSettingsFromInstance (upval), BubbleChatSettingsChangedModule (upval), connectPropertyChangedSignalsToInstance (upval)
		local Flag = false
		
		for _, className in ipairs(ClassNames) do
			if className == Child.ClassName then
				Flag = true
				break
			end
		end
		if Flag then
			local Entry = t1[Child.ClassName]
			
			if Entry then
				for _, Connection in ipairs(Entry) do
					Connection:Disconnect()
				end
			end
			t1[Child.ClassName] = nil
			p3:dispatch(BubbleChatChildRemovedModule(Child.ClassName))
			local ClassName = BubbleChatConfiguration:FindFirstChildOfClass(Child.ClassName)
			
			if ClassName then
				p3:dispatch(BubbleChatSettingsChangedModule(Child.ClassName, (getSettingsFromInstance(ClassName))))
				t1[ClassName.ClassName] = connectPropertyChangedSignalsToInstance(p3, ClassName)
			end
		end
	end)
	BubbleChatConfiguration.ChildAdded:Connect(function(Child)
		-- upvalues: ClassNames (upval), p3 (copy), getSettingsFromInstance (upval), BubbleChatSettingsChangedModule (upval), connectPropertyChangedSignalsToInstance (upval), t1 (copy)
		local Flag = false
		
		for _, className in ipairs(ClassNames) do
			if className == Child.ClassName then
				Flag = true
				break
			end
		end
		if Flag and p3:getState().BubbleChatSettings[Child.ClassName] == nil then
			p3:dispatch(BubbleChatSettingsChangedModule(Child.ClassName, (getSettingsFromInstance(Child))))
			t1[Child.ClassName] = connectPropertyChangedSignalsToInstance(p3, Child)
		end
	end)
	
	return t
end