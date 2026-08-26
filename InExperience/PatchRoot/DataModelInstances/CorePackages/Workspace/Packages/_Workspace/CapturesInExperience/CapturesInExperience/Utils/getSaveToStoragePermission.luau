local parent = script.Parent.Parent
local userInputService = game:GetService("UserInputService")
local default = require(parent.Parent.PermissionsProtocol).PermissionsProtocol.default
local saveCaptureToExternalStorageModule = require(parent.Thunks.SaveCaptureToExternalStorage)
local saveCapturesToExternalStorageModule = require(parent.Thunks.SaveCapturesToExternalStorage)
local _ = require(parent.Types)

return function(p1, p2, p3)
	-- upvalues: default (ref), userInputService (ref), saveCapturesToExternalStorageModule (ref), saveCaptureToExternalStorageModule (ref)
	default:hasPermissions({ default.Permissions.WRITE_MEDIA_STORAGE }):andThen(function(p4)
		-- upvalues: default (copy), userInputService (copy), p2 (ref), p1 (ref), p3 (ref), saveCapturesToExternalStorageModule (copy), saveCaptureToExternalStorageModule (copy)
		local var1 = if p4.status ~= default.Status.AUTHORIZED then userInputService:GetPlatform() == Enum.Platform.OSX else true
		
		if userInputService:GetPlatform() == Enum.Platform.Android and not var1 then
			if p2 then
				assert(p2 ~= nil, "openPermissionModal is not nil")
				p2()
				
				return
			end
			return
		elseif not var1 then
			default:requestPermissions({ default.Permissions.WRITE_MEDIA_STORAGE }):andThen(function(p5)
				-- upvalues: default (copy), p1 (copy), p3 (copy), saveCapturesToExternalStorageModule (copy), saveCaptureToExternalStorageModule (copy)
				if if p5.status ~= default.Status.AUTHORIZED then p5.status == default.Status.UNSUPPORTED else true then
					if #p1 > 0 then
						p3(saveCapturesToExternalStorageModule(p1))
						
						return
					end
					p3(saveCaptureToExternalStorageModule(p1))
				end
			end):catch(function() end)
			
			return
		elseif #p1 > 0 then
			p3(saveCapturesToExternalStorageModule(p1))
			
			return
		end
		p3(saveCaptureToExternalStorageModule(p1))
	end):catch(function()
		-- upvalues: userInputService (copy), p2 (ref)
		if userInputService:GetPlatform() ~= Enum.Platform.Android then return end
		if p2 then
			assert(p2 ~= nil, "openPermissionModal is not nil")
			p2()
			
			return
		end
	end)
	
	return nil
end