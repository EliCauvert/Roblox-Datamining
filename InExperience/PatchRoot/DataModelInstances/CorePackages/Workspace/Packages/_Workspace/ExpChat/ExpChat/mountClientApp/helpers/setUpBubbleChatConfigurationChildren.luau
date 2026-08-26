local textChatService = game:GetService("TextChatService")
local expChat = script:FindFirstAncestor("ExpChat")
local actions = expChat.Actions
local bubbleChatSettingsChangedModule = require(actions.BubbleChatSettingsChanged)
local bubbleChatChildSettingChangedModule = require(actions.BubbleChatChildSettingChanged)
local bubbleChatChildRemovedModule = require(actions.BubbleChatChildRemoved)
local getSetUpBubbleChatConfigurationChildPropertiesModule = require(expChat.Flags.getSetUpBubbleChatConfigurationChildProperties)
local defaultBubbleChatChildrenCustomizationProperties = require(expChat.Config).DefaultBubbleChatChildrenCustomizationProperties
local list = { "ImageLabel", "UIGradient", "UICorner", "UIPadding" }

local function getSettingsFromInstance(a)
	-- upvalues: defaultBubbleChatChildrenCustomizationProperties (ref)
	local t = {}
	
	for i, v in pairs(defaultBubbleChatChildrenCustomizationProperties[a.ClassName]) do
		if a[i] ~= nil then
			t[i] = a[i]
		end
	end
	return t
end

local function connectPropertyChangedSignalsToInstance(value, p1)
	-- upvalues: defaultBubbleChatChildrenCustomizationProperties (ref), bubbleChatChildSettingChangedModule (ref)
	local t = {}
	
	for i, v in pairs(defaultBubbleChatChildrenCustomizationProperties[p1.ClassName]) do
		if p1[i] ~= nil then
			table.insert(t, p1:GetPropertyChangedSignal(i):Connect(function()
				-- upvalues: value (ref), bubbleChatChildSettingChangedModule (copy), p1 (ref), i (ref)
				value:dispatch(bubbleChatChildSettingChangedModule(p1.ClassName, i, p1[i]))
			end))
		end
	end
	return t
end

local function _(value)
	if value then
		for i, v in ipairs(value) do
			v:Disconnect()
		end
	end
end

local _ = function(p2)
	-- upvalues: list (ref)
	for i, v in ipairs(list) do
		if v == p2.ClassName then
			return true
		end
	end
	return false
end

return function(p3)
	-- upvalues: textChatService (ref), getSetUpBubbleChatConfigurationChildPropertiesModule (ref), defaultBubbleChatChildrenCustomizationProperties (ref), getSettingsFromInstance (ref), connectPropertyChangedSignalsToInstance (ref), list (ref), bubbleChatChildRemovedModule (ref), bubbleChatSettingsChangedModule (ref)
	local bubbleChatConfiguration = textChatService:FindFirstChildOfClass("BubbleChatConfiguration")
	
	if bubbleChatConfiguration == nil or getSetUpBubbleChatConfigurationChildPropertiesModule() == false then
		return defaultBubbleChatChildrenCustomizationProperties
	end
	local t = {}
	local t_1 = {}
	assert(bubbleChatConfiguration ~= nil, "BubbleChatConfiguration cannot be nil.")
	
	for i, v in ipairs({
		bubbleChatConfiguration:FindFirstChildOfClass("ImageLabel"),
		bubbleChatConfiguration:FindFirstChildOfClass("UIGradient"),
		bubbleChatConfiguration:FindFirstChildOfClass("UICorner"),
		bubbleChatConfiguration:FindFirstChildOfClass("UIPadding")
	}) do
		if v then
			t[v.ClassName] = getSettingsFromInstance(v)
			t_1[v.ClassName] = connectPropertyChangedSignalsToInstance(p3, v)
		end
	end
	bubbleChatConfiguration.ChildRemoved:Connect(function(p4)
		-- upvalues: list (copy), t_1 (ref), p3 (ref), bubbleChatChildRemovedModule (copy), bubbleChatConfiguration (ref), getSettingsFromInstance (copy), bubbleChatSettingsChangedModule (copy), connectPropertyChangedSignalsToInstance (copy)
		local className
		for i, v in ipairs(list) do
			if v == p4.ClassName then
				className = true
				if className then
					className = t_1[p4.ClassName]
					
					if className then
						for i, v in ipairs(className) do
							v:Disconnect()
						end
					end
					t_1[p4.ClassName] = nil
					p3:dispatch(bubbleChatChildRemovedModule(p4.ClassName))
					className = bubbleChatConfiguration:FindFirstChildOfClass(p4.ClassName)
					
					if className then
						p3:dispatch(bubbleChatSettingsChangedModule(p4.ClassName, getSettingsFromInstance(className)))
						t_1[className.ClassName] = connectPropertyChangedSignalsToInstance(p3, className)
					end
				end
				return
			end
		end
		className = false
	end)
	bubbleChatConfiguration.ChildAdded:Connect(function(p5)
		-- upvalues: list (copy), p3 (ref), getSettingsFromInstance (copy), bubbleChatSettingsChangedModule (copy), connectPropertyChangedSignalsToInstance (copy), t_1 (ref)
		local var1
		for i, v in ipairs(list) do
			if v == p5.ClassName then
				var1 = true
				if var1 and p3:getState().BubbleChatSettings[p5.ClassName] == nil then
					p3:dispatch(bubbleChatSettingsChangedModule(p5.ClassName, getSettingsFromInstance(p5)))
					t_1[p5.ClassName] = connectPropertyChangedSignalsToInstance(p3, p5)
				end
				return
			end
		end
		var1 = false
	end)
	
	return t
end