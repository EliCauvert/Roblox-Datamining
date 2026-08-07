local coreGuiService = game:GetService("CoreGui")
local roactModule = require(game:GetService("CorePackages").Packages.Roact)
local robloxGui = coreGuiService:WaitForChild("RobloxGui")
local captureNotificationModule = require(robloxGui.Modules.CaptureNotification)
local shouldSaveScreenshotToAlbumModule = require(robloxGui.Modules.shouldSaveScreenshotToAlbum)
local t = {}
t.__index = t

function t.new() --[[ line: 21 ]]
	-- upvalues: t (ref), shouldSaveScreenshotToAlbumModule (ref), roactModule (ref), captureNotificationModule (ref)
	local t_1 = {}
	setmetatable(t_1, t)
	t_1.init = false
	t_1.captureEvent = Instance.new("BindableEvent")
	t_1.permissionEvent = Instance.new("BindableEvent")
	
	if shouldSaveScreenshotToAlbumModule() then
		t_1.captureNotification = roactModule.createElement(captureNotificationModule, { permissionEvent = t_1.permissionEvent })
	end
	return t_1
end

function t:Start() --[[ line: 36 ]]
	-- upvalues: shouldSaveScreenshotToAlbumModule (ref), roactModule (ref), coreGuiService (ref)
	if self.init then return end
	self.init = true
	
	if shouldSaveScreenshotToAlbumModule() then
		self.captureNotificationInstance = roactModule.mount(self.captureNotification, coreGuiService, "RobloxCaptureNotificationGui")
	end
end

local var6 = t.new()

function t:DismissNotification() --[[ line: 50 ]]
	-- upvalues: var6 (ref), shouldSaveScreenshotToAlbumModule (ref), roactModule (ref), captureNotificationModule (ref)
	if not self.init then
		var6:Start()
		
		return
	elseif shouldSaveScreenshotToAlbumModule() then
		roactModule.update(self.captureNotificationInstance, roactModule.createElement(captureNotificationModule, {
			permissionEvent = self.permissionEvent,
			forceDismissToast = {
				onDismissed = function() --[[ line: 59 ]]
					-- upvalues: roactModule (copy), self (ref), captureNotificationModule (copy)
					roactModule.update(self.captureNotificationInstance, roactModule.createElement(captureNotificationModule, {
						forceDismissToast = nil,
						permissionEvent = self.permissionEvent
					}))
				end
			}
		}))
	end
end

function t:ShowPermissionToast() --[[ line: 74 ]]
	-- upvalues: var6 (ref)
	if not self.init then
		var6:Start()
	end
	self.permissionEvent:Fire()
end

function t:Capture() --[[ line: 81 ]]
	self:DismissNotification()
	self.captureEvent:Fire()
end

return var6