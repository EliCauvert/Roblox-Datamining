local CustomForms = script:FindFirstAncestor("CustomForms")
local Parent = CustomForms.Parent
local PromiseModule = require(Parent.Promise)
local _ = require(Parent.SduiCoreSystem)
local CustomFormEntryModule = require(CustomForms.Sdui.customFormEntry)
local GetSduiCustomFormVerticalRegistryModule = require(CustomForms.Sdui.getSduiCustomFormVerticalRegistry)

local function _(p1): boolean
	return type(p1) == "string" and p1 ~= ""
end

return function(p1, _, p2)
	-- upvalues: PromiseModule (copy), GetSduiCustomFormVerticalRegistryModule (copy), CustomFormEntryModule (copy)
	local ActionParams = if p1 then p1.actionParams else nil
	local EntityId = if ActionParams then ActionParams.entityId else nil
	local FormId = if ActionParams then ActionParams.formId else nil
	local CfVertical = if ActionParams then ActionParams.cfVertical else nil
	local ConfigKey = p2.configKey
	
	if type(EntityId) ~= "string" or EntityId == "" or (type(FormId) ~= "string" or FormId == "") or (type(CfVertical) ~= "string" or CfVertical == "") or (type(ConfigKey) ~= "string" or ConfigKey == "") then
		return PromiseModule.resolve(nil)
	end
	assert(ConfigKey, "checked above")
	local Vertical = GetSduiCustomFormVerticalRegistryModule().getVertical(CfVertical)
	local FetchResults = if Vertical then Vertical.fetchResults else nil
	
	if FetchResults then
		local Form = CustomFormEntryModule.findForm(ConfigKey, FormId)
		
		return if Form == nil then PromiseModule.resolve(nil) else PromiseModule.try(FetchResults, {
			entityId = EntityId,
			formId = FormId,
			cfVertical = CfVertical,
			current = Form
		}):andThen(function(Result)
			-- upvalues: CustomFormEntryModule (upval), ConfigKey (copy), FormId (copy), PromiseModule (upval)
			return if Result == nil then nil elseif CustomFormEntryModule.updateForm(ConfigKey, FormId, function()
				-- upvalues: Result (copy)
				return Result
			end) then nil else PromiseModule.reject(`Fresh data for form {FormId} doesn't match its entry under {ConfigKey}`)
		end)
	else
		return PromiseModule.resolve(nil)
	end
end