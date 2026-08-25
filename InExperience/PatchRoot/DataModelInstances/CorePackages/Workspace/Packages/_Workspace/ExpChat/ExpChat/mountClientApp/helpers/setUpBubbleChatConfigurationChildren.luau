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

local function connectPropertyChangedSignalsToInstance(value, p0)
	-- upvalues: defaultBubbleChatChildrenCustomizationProperties (ref), bubbleChatChildSettingChangedModule (ref)
	local t = {}
	
	for i, v in pairs(defaultBubbleChatChildrenCustomizationProperties[p0.ClassName]) do
		if p0[i] ~= nil then
			table.insert(t, p0:GetPropertyChangedSignal(i):Connect(function()
				-- upvalues: value (ref), bubbleChatChildSettingChangedModule (copy), p0 (ref), i (ref)
				value:dispatch(bubbleChatChildSettingChangedModule(p0.ClassName, i, p0[i]))
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

local _ = function(p1)
	-- upvalues: list (ref)
	for i, v in ipairs(list) do
		if v == p1.ClassName then
			return true
		end
	end
	return false
end

return function(p2)
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
			t_1[v.ClassName] = connectPropertyChangedSignalsToInstance(p2, v)
		end
	end
	bubbleChatConfiguration.ChildRemoved:Connect(function(p3)
		-- upvalues: list (copy), t_1 (ref), p2 (ref), bubbleChatChildRemovedModule (copy), bubbleChatConfiguration (ref), getSettingsFromInstance (copy), bubbleChatSettingsChangedModule (copy), connectPropertyChangedSignalsToInstance (copy)
		local className
		for i, v in ipairs(list) do
			if v == p3.ClassName then
				className = true
				if className then
					className = t_1[p3.ClassName]
					
					if className then
						for i, v in ipairs(className) do
							v:Disconnect()
						end
					end
					t_1[p3.ClassName] = nil
					p2:dispatch(bubbleChatChildRemovedModule(p3.ClassName))
					className = bubbleChatConfiguration:FindFirstChildOfClass(p3.ClassName)
					
					if className then
						p2:dispatch(bubbleChatSettingsChangedModule(p3.ClassName, getSettingsFromInstance(className)))
						t_1[className.ClassName] = connectPropertyChangedSignalsToInstance(p2, className)
					end
				end
				return
			end
		end
		className = false
	end)
	bubbleChatConfiguration.ChildAdded:Connect(function(p4)
		-- upvalues: list (copy), p2 (ref), getSettingsFromInstance (copy), bubbleChatSettingsChangedModule (copy), connectPropertyChangedSignalsToInstance (copy), t_1 (ref)
		local var15
		for i, v in ipairs(list) do
			if v == p4.ClassName then
				var15 = true
				if var15 and p2:getState().BubbleChatSettings[p4.ClassName] == nil then
					p2:dispatch(bubbleChatSettingsChangedModule(p4.ClassName, getSettingsFromInstance(p4)))
					t_1[p4.ClassName] = connectPropertyChangedSignalsToInstance(p2, p4)
				end
				return
			end
		end
		var15 = false
	end)
	
	return t
end