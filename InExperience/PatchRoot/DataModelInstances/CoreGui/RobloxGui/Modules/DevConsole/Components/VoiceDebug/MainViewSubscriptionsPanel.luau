local roactModule = require(game:GetService("CorePackages").Packages.Roact)
local cellLabelModule = require(script.Parent.Parent.Parent.Components.CellLabel)
local constantsModule = require(script.Parent.Parent.Parent.Constants)
local collapsibleSectionModule = require(script.Parent.CollapsibleSection)
local _ = require(script.Parent.VoiceDebugData)
local uDim = UDim.new(0.13, 0)
local uDim_1 = UDim.new(0.11, 0)
local uDim_2 = UDim.new(0.11, 0)
local uDim_3 = UDim.new(0.12, 0)
local uDim_4 = UDim.new(0.11, 0)
local uDim_5 = UDim.new(0.14, 0)
local uDim_6 = UDim.new(0.1, 0)
local uDim_7 = UDim.new(0.09, 0)
local uDim_8 = UDim.new(0.09, 0)
local var1 = uDim + uDim_1
local var2 = var1 + uDim_2
local var3 = var2 + uDim_3
local var4 = var3 + uDim_4
local var5 = var4 + uDim_5
local var6 = var5 + uDim_6
local var7 = var6 + uDim_7
local textBoxGray = constantsModule.Color.TextBoxGray

local function _(p1)
	return if type(p1) == "number" and p1 == p1 and p1 % 1 == 0 then string.format("0x%08X", p1) else "\226\128\148"
end

local _ = function(p1)
	return if p1 == nil or p1 == "" then "\226\128\148" else tostring(p1)
end

local _ = function(p1)
	return if type(p1) == "boolean" then if p1 then "Yes" else "No" else "\226\128\148"
end

local _ = function(p1)
	if p1.culled == true then
		return "\226\128\148"
	end
	local incomingBitrateKbps = p1.incomingBitrateKbps
	
	return if type(incomingBitrateKbps) == "number" then string.format("%.2f kbps", incomingBitrateKbps) else "\226\128\148"
end

local _ = function(p1)
	if p1.culled == true then
		return "\226\128\148"
	end
	local codecName = p1.codecName
	
	return if codecName == nil or codecName == "" then "\226\128\148" else tostring(codecName)
end

local function HeaderCell(p1)
	-- upvalues: roactModule (ref), constantsModule (ref)
	return roactModule.createElement("TextLabel", {
		BackgroundTransparency = 1,
		Text = string.upper(p1.text),
		Size = p1.size,
		Position = p1.pos,
		Font = constantsModule.Font.MainWindowHeader,
		TextSize = constantsModule.DefaultFontSize.MainWindowHeader,
		TextColor3 = constantsModule.Color.BorderGray,
		TextXAlignment = Enum.TextXAlignment.Left
	})
end

local function SubscriptionsTable(p1)
	-- upvalues: roactModule (ref), textBoxGray (ref), cellLabelModule (ref), uDim (ref), uDim_1 (ref), uDim (ref), uDim_2 (ref), var1 (ref), uDim_3 (ref), var2 (ref), uDim_4 (ref), var3 (ref), uDim_5 (ref), var4 (ref), uDim_6 (ref), var5 (ref), uDim_7 (ref), var6 (ref), uDim_8 (ref), var7 (ref), HeaderCell (ref)
	local subscriptions = p1.subscriptions or {}
	local layoutOrder = p1.layoutOrder
	local t = {}
	
	for i, v in subscriptions do
		local var8
		local var9 = v.culled == true
		local text = "subscription" .. i
		local createElement = roactModule.createElement
		local var10 = "Frame"
		local t_1 = {
			BorderSizePixel = 0,
			Size = UDim2.new(1, 0, 0, 20),
			LayoutOrder = i,
			BackgroundColor3 = textBoxGray,
			BackgroundTransparency = if var9 then 0.6 else 1
		}
		local t_2 = {}
		local createElement_1 = roactModule.createElement
		local t_3 = {}
		local audioSsrc = v.audioSsrc
		t_3.text = if type(audioSsrc) == "number" and audioSsrc == audioSsrc and audioSsrc % 1 == 0 then string.format("0x%08X", audioSsrc) else "\226\128\148"
		t_3.size = UDim2.new(uDim, UDim.new(1, 0))
		t_3.pos = UDim2.new(0, 0, 0, 0)
		t_2.AudioSsrc = createElement_1(cellLabelModule, t_3)
		local createElement_2 = roactModule.createElement
		local t_4 = {
			text = if audioSsrc == nil or audioSsrc == "" then "\226\128\148" else tostring(audioSsrc),
			size = UDim2.new(uDim_1, UDim.new(1, 0)),
			pos = UDim2.new(uDim, UDim.new(0, 0))
		}
		audioSsrc = v.feedReferenceId
		t_2.FeedId = createElement_2(cellLabelModule, t_4)
		local createElement_3 = roactModule.createElement
		local t_5 = {
			text = if audioSsrc == nil or audioSsrc == "" then "\226\128\148" else tostring(audioSsrc),
			size = UDim2.new(uDim_2, UDim.new(1, 0)),
			pos = UDim2.new(var1, UDim.new(0, 0))
		}
		audioSsrc = v.userId
		t_2.UserId = createElement_3(cellLabelModule, t_5)
		local createElement_4 = roactModule.createElement
		local t_6 = {
			text = if audioSsrc == nil or audioSsrc == "" then "\226\128\148" else tostring(audioSsrc),
			size = UDim2.new(uDim_3, UDim.new(1, 0)),
			pos = UDim2.new(var2, UDim.new(0, 0)),
			textTruncate = Enum.TextTruncate.AtEnd
		}
		audioSsrc = v.audioMid
		t_2.AudioMid = createElement_4(cellLabelModule, t_6)
		local createElement_5 = roactModule.createElement
		local t_7 = {}
		
		if v.culled == true then
			var8 = "\226\128\148"
		else
			audioSsrc = v.incomingBitrateKbps
			var8 = if type(audioSsrc) ~= "number" then string.format("%.2f kbps", audioSsrc) else "\226\128\148"
		end
		local var11
		t_7.text = var8
		t_7.size = UDim2.new(uDim_4, UDim.new(1, 0))
		t_7.pos = UDim2.new(var3, UDim.new(0, 0))
		t_2.Bitrate = createElement_5(cellLabelModule, t_7)
		local createElement_6 = roactModule.createElement
		local t_8 = {}
		
		if v.culled == true then
			var11 = "\226\128\148"
		else
			audioSsrc = v.codecName
			var11 = if audioSsrc == nil or audioSsrc == "" then "\226\128\148" else tostring(audioSsrc)
		end
		t_8.text = var11
		t_8.size = UDim2.new(uDim_5, UDim.new(1, 0))
		t_8.pos = UDim2.new(var4, UDim.new(0, 0))
		t_8.textTruncate = Enum.TextTruncate.AtEnd
		t_2.Codec = createElement_6(cellLabelModule, t_8)
		local createElement_7 = roactModule.createElement
		local t_9 = {}
		audioSsrc = v.culled
		t_9.text = if type(audioSsrc) ~= "boolean" then if audioSsrc then "Yes" else "No" else "\226\128\148"
		t_9.size = UDim2.new(uDim_6, UDim.new(1, 0))
		t_9.pos = UDim2.new(var5, UDim.new(0, 0))
		t_2.Culled = createElement_7(cellLabelModule, t_9)
		local createElement_8 = roactModule.createElement
		local t_10 = {
			text = if type(audioSsrc) ~= "boolean" then if audioSsrc then "Yes" else "No" else "\226\128\148",
			size = UDim2.new(uDim_7, UDim.new(1, 0)),
			pos = UDim2.new(var6, UDim.new(0, 0))
		}
		audioSsrc = v.isMuted
		t_2.Muted = createElement_8(cellLabelModule, t_10)
		local createElement_9 = roactModule.createElement
		local var12 = cellLabelModule
		local t_11 = {
			text = if type(audioSsrc) ~= "boolean" then if audioSsrc then "Yes" else "No" else "\226\128\148",
			size = UDim2.new(uDim_8, UDim.new(1, 0)),
			pos = UDim2.new(var7, UDim.new(0, 0))
		}
		audioSsrc = v.isMutedLocally
		t_2.MutedLocally = createElement_9(var12, t_11)
		t[text] = createElement(var10, t_1, t_2)
	end
	if next(t) == nil then
		t.placeholder = roactModule.createElement(cellLabelModule, {
			text = "\226\128\148",
			layoutOrder = 1,
			size = UDim2.new(1, 0, 0, 20),
			pos = UDim2.new()
		})
	end
	return roactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 0, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		LayoutOrder = layoutOrder
	}, {
		UIListLayout = roactModule.createElement("UIListLayout", { SortOrder = Enum.SortOrder.LayoutOrder }),
		Header = roactModule.createElement("Frame", {
			LayoutOrder = 1,
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 0, 20)
		}, {
			AudioSsrc = roactModule.createElement(HeaderCell, {
				text = "Audio Ssrc",
				size = UDim2.new(uDim, UDim.new(1, 0)),
				pos = UDim2.new(0, 0, 0, 0)
			}),
			FeedId = roactModule.createElement(HeaderCell, {
				text = "Feed ID",
				size = UDim2.new(uDim_1, UDim.new(1, 0)),
				pos = UDim2.new(uDim, UDim.new(0, 0))
			}),
			UserId = roactModule.createElement(HeaderCell, {
				text = "User ID",
				size = UDim2.new(uDim_2, UDim.new(1, 0)),
				pos = UDim2.new(var1, UDim.new(0, 0))
			}),
			AudioMid = roactModule.createElement(HeaderCell, {
				text = "Audio Mid",
				size = UDim2.new(uDim_3, UDim.new(1, 0)),
				pos = UDim2.new(var2, UDim.new(0, 0))
			}),
			Bitrate = roactModule.createElement(HeaderCell, {
				text = "Bitrate",
				size = UDim2.new(uDim_4, UDim.new(1, 0)),
				pos = UDim2.new(var3, UDim.new(0, 0))
			}),
			Codec = roactModule.createElement(HeaderCell, {
				text = "Codec",
				size = UDim2.new(uDim_5, UDim.new(1, 0)),
				pos = UDim2.new(var4, UDim.new(0, 0))
			}),
			Culled = roactModule.createElement(HeaderCell, {
				text = "Culled",
				size = UDim2.new(uDim_6, UDim.new(1, 0)),
				pos = UDim2.new(var5, UDim.new(0, 0))
			}),
			Muted = roactModule.createElement(HeaderCell, {
				text = "Muted",
				size = UDim2.new(uDim_7, UDim.new(1, 0)),
				pos = UDim2.new(var6, UDim.new(0, 0))
			}),
			MutedLocally = roactModule.createElement(HeaderCell, {
				text = "Muted Locally",
				size = UDim2.new(uDim_8, UDim.new(1, 0)),
				pos = UDim2.new(var7, UDim.new(0, 0))
			})
		}),
		Rows = roactModule.createElement("Frame", {
			LayoutOrder = 2,
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 0, 0),
			AutomaticSize = Enum.AutomaticSize.Y
		}, {
			UIListLayout = roactModule.createElement("UIListLayout", { SortOrder = Enum.SortOrder.LayoutOrder }),
			Rows = roactModule.createFragment(t)
		})
	})
end

return function(p2)
	-- upvalues: roactModule (ref), collapsibleSectionModule (ref), SubscriptionsTable (ref)
	return roactModule.createElement(collapsibleSectionModule, { title = "Subscriptions", layoutOrder = p2.layoutOrder }, {
		Table = roactModule.createElement(SubscriptionsTable, { layoutOrder = 1, subscriptions = p2.subscriptions })
	})
end