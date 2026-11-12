local EnumsModule = require(script:FindFirstAncestor("AvatarExperienceProfilePictureEditor").Common.Enums)
local CloseProfilePictureEditorModule = require(script.Parent.closeProfilePictureEditor)
local EntrySurfaceModule = require(script.Parent.entrySurface)

local function _(p1)
	if p1.getParam == nil then
		return nil
	else
		local CallbackParam = p1.getParam("callback")
		
		return if typeof(CallbackParam) == "string" and CallbackParam ~= "" then CallbackParam else nil
	end
end

return function(p1, Callback)
	-- upvalues: CloseProfilePictureEditorModule (copy), EnumsModule (copy), EntrySurfaceModule (copy)
	local v1 = nil
	if p1.getParam == nil then
		v1 = nil
	else
		local CallbackParam = p1.getParam("callback")
		v1 = if typeof(CallbackParam) == "string" and CallbackParam ~= "" then CallbackParam else nil
	end
	if Callback == nil or v1 == nil then
		CloseProfilePictureEditorModule(p1)
		
		return
	end
	if p1.setParams ~= nil then
		p1.setParams({
			callback = "",
			mode = EnumsModule.EditProfileImageMode.Default
		})
	end
	EntrySurfaceModule.park(p1, (EntrySurfaceModule.resolve(p1)))
	
	if not Callback(v1) then
		CloseProfilePictureEditorModule(p1)
	end
end