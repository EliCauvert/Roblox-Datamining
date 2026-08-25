local parent = script.Parent.Parent
local userInputService = game:GetService("UserInputService")
local default = require(parent.Parent.PermissionsProtocol).PermissionsProtocol.default
local saveCaptureToExternalStorageModule = require(parent.Thunks.SaveCaptureToExternalStorage)
local saveCapturesToExternalStorageModule = require(parent.Thunks.SaveCapturesToExternalStorage)
local _ = require(parent.Types)

return function(p0, p1, p2)
	-- upvalues: default (ref), userInputService (ref), saveCapturesToExternalStorageModule (ref), saveCaptureToExternalStorageModule (ref)
	default:hasPermissions({ default.Permissions.WRITE_MEDIA_STORAGE }):andThen(function(p3)
		-- upvalues: default (copy), userInputService (copy), p1 (ref), p0 (ref), p2 (ref), saveCapturesToExternalStorageModule (copy), saveCaptureToExternalStorageModule (copy)
		local var3 = if p3.status ~= default.Status.AUTHORIZED then userInputService:GetPlatform() == Enum.Platform.OSX else true
		
		if userInputService:GetPlatform() == Enum.Platform.Android and not var3 then
			if p1 then
				assert(p1 ~= nil, "openPermissionModal is not nil")
				p1()
				
				return
			end
			return
		elseif not var3 then
			default:requestPermissions({ default.Permissions.WRITE_MEDIA_STORAGE }):andThen(function(p4)
				-- upvalues: default (copy), p0 (copy), p2 (copy), saveCapturesToExternalStorageModule (copy), saveCaptureToExternalStorageModule (copy)
				if if p4.status ~= default.Status.AUTHORIZED then p4.status == default.Status.UNSUPPORTED else true then
					if #p0 > 0 then
						p2(saveCapturesToExternalStorageModule(p0))
						
						return
					end
					p2(saveCaptureToExternalStorageModule(p0))
				end
			end):catch(function() end)
			
			return
		elseif #p0 > 0 then
			p2(saveCapturesToExternalStorageModule(p0))
			
			return
		end
		p2(saveCaptureToExternalStorageModule(p0))
	end):catch(function()
		-- upvalues: userInputService (copy), p1 (ref)
		if userInputService:GetPlatform() ~= Enum.Platform.Android then return end
		if p1 then
			assert(p1 ~= nil, "openPermissionModal is not nil")
			p1()
			
			return
		end
	end)
	
	return nil
end