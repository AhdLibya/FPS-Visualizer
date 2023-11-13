local Trove = require(script.Parent.Dependencies.Trove)
local Signal = require(script.Parent.Dependencies.Signal)
export type GuiType = typeof(script.Main)
export type ExplorerItem = typeof(script.Item)

export type widgetInstance = {
	activate: 		(self: widgetInstance) -> ();
	destroy: 		(self: widgetInstance) -> ();
	isActive: 		(self: widgetInstance) -> boolean;
	get: 			(self: widgetInstance) -> DockWidgetPluginGui;
	bindToClose: 	(self: widgetInstance, CallBack: () -> ()) -> ();
	setActive: 		(self: widgetInstance, Active: boolean) -> ();
}


export type GuiWarpper = {
	_trove: typeof(Trove.new());
	init: (self: GuiWarpper) -> GuiWarpper;
	enableDrag: (self: GuiWarpper) -> GuiWarpper;
	select: (self: GuiWarpper , item: Frame) -> GuiWarpper;
	deselect: (self: GuiWarpper , item: Frame) -> GuiWarpper;
	cleanup: (self: GuiWarpper) -> ();
	InstanceAttached: Signal.Signal<...any>;
	RemoveSignal: Signal.Signal<...any>;
	TerminateSignal: Signal.Signal<...any>;
	Alert: (self: GuiWarpper, message: string, OkCallBack: () -> ()) -> () -> ();
	instanceDeselect: (self: GuiWarpper ,instance: Instance) -> ();
}

export type _setupPanel = {
	_widget: widgetInstance;
	_toolBarButton: PluginToolbarButton;
	_tempFile: ViewportFrame;
	_instance: GuiType;
	_trove: typeof(Trove.new());
	_viewportButton: PluginToolbarButton;
	_guiHanlder: GuiWarpper;
	_selected: Model?;
	OnClose: Signal.Signal<...any>;
	_viewportWidgetEnabled: boolean;
	_activeViewportInstance: ViewportFrame;
	_lastAlert: () -> ()?;
	createDockWidget: (self: _setupPanel) -> ();
	removeDockWidget: (self: _setupPanel) -> ();
	destroy: (self: _setupPanel) -> ();
	open: (self: _setupPanel) -> ();
	close: (self: _setupPanel) -> ();
	free: (self: _setupPanel) -> ();
	setToViewport: (self: _setupPanel, instance: Instance?) -> ();
}

export type ImageData = {
	Image: string,
	ImageRectOffset: Vector2,
	ImageRectSize: Vector2,
}

export type SetupPanelInstance = {
	closeViewportWidget: (self: SetupPanelInstance) -> ();
	createDockWidget: (self: SetupPanelInstance) -> ();
	removeDockWidget: (self: SetupPanelInstance) -> ();
	destroy: (self: SetupPanelInstance) -> ();
	open: (self: SetupPanelInstance) -> ();
	close: (self: SetupPanelInstance) -> ();
	free: (self: SetupPanelInstance) -> ();
	OnClose: Signal.Signal<...any>;
}

export type WidgetInfo = {
	Title: string;
	DockInfo: DockWidgetPluginGuiInfo?;
}

export type Widget = {
	Plugin: Plugin;
	Widget: DockWidgetPluginGui;
	NilWidget: {DockWidgetPluginGui};
	Info: WidgetInfo;
}



return nil