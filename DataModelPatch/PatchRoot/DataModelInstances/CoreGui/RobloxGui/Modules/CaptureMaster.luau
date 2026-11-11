local CoreGui = game:GetService("CoreGui")
local RoactModule = require(game:GetService("CorePackages").Packages.Roact)
local RobloxGui = CoreGui:WaitForChild("RobloxGui")
local CaptureNotificationModule = require(RobloxGui.Modules.CaptureNotification)
local ShouldSaveScreenshotToAlbumModule = require(RobloxGui.Modules.shouldSaveScreenshotToAlbum)
local Module = {}
Module.__index = Module

function Module.new()
	-- upvalues: Module (copy), ShouldSaveScreenshotToAlbumModule (copy), RoactModule (copy), CaptureNotificationModule (copy)
	local t = {}
	setmetatable(t, Module)
	t.init = false
	t.captureEvent = Instance.new("BindableEvent")
	t.permissionEvent = Instance.new("BindableEvent")
	
	if ShouldSaveScreenshotToAlbumModule() then
		t.captureNotification = RoactModule.createElement(CaptureNotificationModule, { permissionEvent = t.permissionEvent })
	end
	return t
end

function Module:Start()
	-- upvalues: ShouldSaveScreenshotToAlbumModule (copy), RoactModule (copy), CoreGui (copy)
	if self.init then return end
	self.init = true
	
	if ShouldSaveScreenshotToAlbumModule() then
		self.captureNotificationInstance = RoactModule.mount(self.captureNotification, CoreGui, "RobloxCaptureNotificationGui")
	end
end

local NewModule = Module.new()

function Module:DismissNotification()
	-- upvalues: NewModule (copy), ShouldSaveScreenshotToAlbumModule (copy), RoactModule (copy), CaptureNotificationModule (copy)
	if not self.init then
		NewModule:Start()
		
		return
	end
	if ShouldSaveScreenshotToAlbumModule() then
		RoactModule.update(self.captureNotificationInstance, RoactModule.createElement(CaptureNotificationModule, {
			permissionEvent = self.permissionEvent,
			forceDismissToast = {
				onDismissed = function()
					-- upvalues: RoactModule (upval), self (copy), CaptureNotificationModule (upval)
					RoactModule.update(self.captureNotificationInstance, RoactModule.createElement(CaptureNotificationModule, {
						forceDismissToast = nil,
						permissionEvent = self.permissionEvent
					}))
				end
			}
		}))
	end
end

function Module:ShowPermissionToast()
	-- upvalues: NewModule (copy)
	if not self.init then
		NewModule:Start()
	end
	self.permissionEvent:Fire()
end

function Module:Capture()
	self:DismissNotification()
	self.captureEvent:Fire()
end

return NewModule