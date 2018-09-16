import * as md5 from 'md5'
import { IUser, UserGroup } from './interface'

export const Int = (x: any) => parseInt(x, 10)

export const glink = (m = '', d = 'wavatar') => (
	`//cdn.v2ex.com/gravatar/${md5(m)}?d=${d}`
)

export function isGroup(user: IUser, type: string | number, diff = 0) {
	let group: UserGroup
	switch (type) {
		case 'root':
		case 'admin':
		case 'common':
			group = UserGroup[type]
			break
		default:
			group = Number(type)
	}
	return user && user.group - group >= diff
}

export function parseTime(t: number) {
	let tmp = Math.abs(Int(t / 1000))
	const sign = t < 0 ? '-' : '+'
	const s = ('0' + tmp % 60).slice(-2)
	tmp = Int(tmp / 60)
	const m = ('0' + tmp % 60).slice(-2)
	tmp = Int(tmp / 60)
	return `${sign} ${tmp}:${m}:${s}`
}
