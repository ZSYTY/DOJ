import * as React from 'react'
import { withRouter } from 'react-router-dom'

import { Icon, Layout, Menu } from 'antd'

import { Group } from '../../../common/interface'
import { diffGroup } from '../../../common/user'
import { HistoryProps } from '../../util/interface'
import { addListener, globalState, removeListener } from '../../util/state'

import './index.less'

interface MenuClick { key: string }

class Sider extends React.Component<HistoryProps> {
	public state = { global: globalState }
	private onClick = ({ key }: MenuClick) => {
		this.props.history.push(key)
	}
	public componentWillMount() {
		addListener('sider', (global) => {
			this.setState({ global })
		})
	}
	public componentWillUnmount() {
		removeListener('sider')
	}
	public render() {
		const selectedKeys: string[] = []
		const { pathname } = this.props.history.location
		let arr = pathname.match(/^(\/[^/]*)(:?\/|$)/)
		if (arr && arr[1]) { selectedKeys.push(arr[1]) }
		arr = pathname.match(/^(\/(:?manage\/)?[^/]*)(:?\/|$)/)
		if (arr && arr[1]) { selectedKeys.push(arr[1]) }

		const { user } = this.state.global

		return <Layout.Sider
			width={220}
			collapsible={true}
			breakpoint="lg"
			className="sider"
		>
			<div className="logo">
				<div>D</div>
				<h1>Online Judge</h1>
			</div>
			<Menu
				theme="dark"
				mode="inline"
				onClick={this.onClick}
				defaultSelectedKeys={[ '/' ]}
				selectedKeys={selectedKeys}
			>
				<Menu.Item key="/home">
					<Icon type="home" />
					<span>Home</span>
				</Menu.Item>
				<Menu.Item key="/problem">
					<Icon type="file-text" />
					<span>Problem</span>
				</Menu.Item>
				<Menu.Item key="/contest">
					<Icon type="code" />
					<span>Contest</span>
				</Menu.Item>
				<Menu.Item key="/submission">
					<Icon type="calendar" />
					<span>Submission</span>
				</Menu.Item>
				<Menu.Item key="/rank">
					<Icon type="bar-chart" />
					<span>Rank</span>
				</Menu.Item>
				{user && diffGroup(user, Group.admin) && <Menu.SubMenu
					key="manage"
					title={<span>
						<Icon type="dashboard" />
						<span>Manage</span>
					</span>}
				>
					<Menu.Item key="/manage/setting">
						<Icon type="setting" />
						<span>Setting</span>
					</Menu.Item>
					<Menu.Item key="/manage/user">
						<Icon type="team" />
						<span>User</span>
					</Menu.Item>
					<Menu.Item key="/manage/problem">
						<Icon type="database" />
						<span>Problem</span>
					</Menu.Item>
					<Menu.Item key="/manage/contest">
						<Icon type="layout" />
						<span>Contest</span>
					</Menu.Item>
					<Menu.Item key="/manage/file">
						<Icon type="file" />
						<span>File</span>
					</Menu.Item>
				</Menu.SubMenu>}
			</Menu>
		</Layout.Sider>
	}
}

export default withRouter(({ history }) => <Sider history={history} />)
