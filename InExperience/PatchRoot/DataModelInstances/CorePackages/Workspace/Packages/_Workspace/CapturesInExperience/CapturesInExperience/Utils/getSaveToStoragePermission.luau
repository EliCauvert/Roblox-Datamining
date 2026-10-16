local Parent = script.Parent.Parent
local UserInputService = game:GetService("UserInputService")
local Default = require(Parent.Parent.PermissionsProtocol).PermissionsProtocol.default
local SaveCaptureToExternalStorageModule = require(Parent.Thunks.SaveCaptureToExternalStorage)
local SaveCapturesToExternalStorageModule = require(Parent.Thunks.SaveCapturesToExternalStorage)
local _ = require(Parent.Types)

return function(p1, Callback, Callback1) --[[ Line: 13 ]]
	-- upvalues: Default (copy), UserInputService (copy), SaveCapturesToExternalStorageModule (copy), SaveCaptureToExternalStorageModule (copy)
	Default:hasPermissions({ Default.Permissions.WRITE_MEDIA_STORAGE }):andThen(function(Result) --[[ Line: 15 ]]
		-- upvalues: Default (upval), UserInputService (upval), Callback (copy), p1 (copy), Callback1 (copy), SaveCapturesToExternalStorageModule (upval), SaveCaptureToExternalStorageModule (upval)
		local IsStatusMatch: boolean = Result.status == Default.Status.AUTHORIZED or UserInputService:GetPlatform() == Enum.Platform.OSX
		
		if UserInputService:GetPlatform() == Enum.Platform.Android and not IsStatusMatch then
			if Callback then
				assert(Callback ~= nil, "openPermissionModal is not nil")
				Callback()
				
				return
			end
			return
		elseif not IsStatusMatch then
			Default:requestPermissions({ Default.Permissions.WRITE_MEDIA_STORAGE }):andThen(function(Result) --[[ Line: 26 ]]
				-- upvalues: Default (upval), p1 (upval), Callback1 (upval), SaveCapturesToExternalStorageModule (upval), SaveCaptureToExternalStorageModule (upval)
				if Result.status == Default.Status.AUTHORIZED or Result.status == Default.Status.UNSUPPORTED then
					if #p1 > 0 then
						Callback1(SaveCapturesToExternalStorageModule(p1))
						
						return
					end
					Callback1(SaveCaptureToExternalStorageModule(p1))
				end
			end):catch(function() --[[ Line: 38 ]] end)
			
			return
		else
			if #p1 > 0 then
				Callback1(SaveCapturesToExternalStorageModule(p1))
				
				return
			else
				Callback1(SaveCaptureToExternalStorageModule(p1))
			end
		end
	end):catch(function() --[[ Line: 49 ]]
		-- upvalues: UserInputService (upval), Callback (copy)
		if UserInputService:GetPlatform() ~= Enum.Platform.Android then return end
		if Callback then
			assert(Callback ~= nil, "openPermissionModal is not nil")
			Callback()
			
			return
		end
	end)
	
	return nil
end