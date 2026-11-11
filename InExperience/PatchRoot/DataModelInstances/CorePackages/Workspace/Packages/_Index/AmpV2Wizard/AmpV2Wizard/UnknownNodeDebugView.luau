local AmpV2Wizard = script:FindFirstAncestor("AmpV2Wizard")
local Parent = AmpV2Wizard.Parent
local HttpService = game:GetService("HttpService")
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local Dialog = FoundationModule.Dialog
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local DialogSize = FoundationModule.Enums.DialogSize
local _ = require(AmpV2Wizard.Types)

local function _(p1)
	-- upvalues: HttpService (copy)
	if type(p1) == "table" then
		local Success, Result = pcall(function()
			-- upvalues: HttpService (upval), p1 (copy)
			return HttpService:JSONEncode(p1)
		end)
		
		return if Success then Result else tostring(p1)
	else
		return (tostring(p1))
	end
end

local function formatDetails(Details): string
	-- upvalues: HttpService (copy)
	if Details == nil then
		return "(no details)"
	end
	local List = {}
	
	for detail in Details do
		table.insert(List, detail)
	end
	if #List == 0 then
		return "(no details)"
	end
	table.sort(List)
	local List1 = {}
	
	for _, value in List do
		local v1 = "%*: %*"
		local Detail = Details[value]
		local Result1 = nil
		
		if type(Detail) == "table" then
			local Success, Result = pcall(function()
				-- upvalues: HttpService (upval), Detail (copy)
				return HttpService:JSONEncode(Detail)
			end)
			Result1 = if Success then Result else tostring(Detail)
		else
			Result1 = tostring(Detail)
		end
		table.insert(List1, (v1:format(value, Result1)))
	end
	return table.concat(List1, "\n")
end

local _ = function(List)
	local List1 = {}
	
	if List ~= nil then
		for i in List do
			table.insert(List1, i)
		end
		table.sort(List1)
	end
	return List1
end

return function(p1)
	-- upvalues: ReactModule (copy), ButtonVariant (copy), Dialog (copy), DialogSize (copy), formatDetails (copy)
	local ReportFunction = p1.report
	local Transitions = p1.transitions
	local List = {}
	
	if Transitions ~= nil then
		for transition in Transitions do
			table.insert(List, transition)
		end
		table.sort(List)
	end
	return ReactModule.createElement(Dialog.Root, { size = DialogSize.Medium }, {
		Title = ReactModule.createElement(Dialog.Title, { text = `Unrenderable node: {p1.nodeType}` }),
		Content = ReactModule.createElement(Dialog.Content, { LayoutOrder = 2 }, {
			Details = ReactModule.createElement(Dialog.Text, { LayoutOrder = 1, Text = formatDetails(p1.details) }),
			NoOutcomes = if #List == 0 then ReactModule.createElement(Dialog.Text, { Text = "(no outcomes declared)", LayoutOrder = 2 }) else nil
		}),
		Actions = ReactModule.createElement(Dialog.Actions, {
			LayoutOrder = 3,
			actions = ReactModule.useMemo(function()
				-- upvalues: List (copy), p1 (copy), ButtonVariant (upval), ReportFunction (copy)
				local List1 = {}
				
				for i, value in List do
					table.insert(List1, {
						text = `{value} ({p1.transitions[value].kind})`,
						variant = if i == 1 then ButtonVariant.Emphasis else ButtonVariant.Standard,
						onActivated = function()
							-- upvalues: ReportFunction (upval), value (copy)
							if ReportFunction ~= nil then
								ReportFunction(value)
							end
						end
					})
				end
				return List1
			end, { table.concat(List, ","), p1.transitions, ReportFunction })
		})
	})
end